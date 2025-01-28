import 'dart:async';

import 'package:collection/collection.dart';
import 'package:color_order_match/domain/model/color_option.dart';
import 'package:color_order_match/domain/repository/record_repository.dart';
import 'package:color_order_match/presentation/game/game_state.dart';
import 'package:color_order_match/ui/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:color_order_match/domain/model/record.dart';

class GameViewModel with ChangeNotifier {

  final RecordRepository _recordRepository;
  late Timer? _timer;

  GameState _state = const GameState();
  GameState get state => _state;

  final _gameEndController = StreamController<int>();
  Stream<int> get gameEndStream => _gameEndController.stream;

  GameViewModel({
    required RecordRepository recordRepository,
  }) : _recordRepository = recordRepository;

  void startGame(int colorGroup) async {
    _loadRecord(colorGroup);
    generateRandomOrder(colorGroup);
    _state = _state.copyWith(
      isStarted: true,
    );
  }

  void generateRandomOrder(int colorGroup) async {
    int amount = 3;
    //todo amount
    if(_state.score >= 200) {
      amount = 7;
    }else if(_state.score >= 150) {
      amount = 6;
    }else if(_state.score >= 100) {
      amount = 5;
    }else if(_state.score >= 50) {
      amount = 4;
    }
    final List<Color> colors;
    switch(colorGroup) {
      case 0:
        colors = classic;
        break;
      case 1:
        colors = pastel;
        break;
      case 2:
        colors = neon;
        break;
      case 3:
        colors = vintage;
        break;
      default:
        colors = classic;
        break;
    }
    final List<Color> tmpColors = [...colors]..shuffle();
    final List<Color> randomOrder = tmpColors.take(amount).toList();
    List<Color> tmpShuffledOrder;
    do {
      tmpShuffledOrder = [...randomOrder]..shuffle();
    } while (const ListEquality().equals(randomOrder, tmpShuffledOrder));
    final List<ColorOption> shuffledOrder = tmpShuffledOrder.map((e) {
      return ColorOption(
        color: e,
      );
    }).toList();
    _state = _state.copyWith(
      randomOrder: randomOrder,
      shuffledOrder: shuffledOrder,
      userSelection: [],
      isShowOrder: true,
      isCorrect: false,
      isWrong: false,
      showRemainingTime: _state.isStarted ? 5 : 8,
    );
    notifyListeners();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if(_state.showRemainingTime > 0) {
        _state = _state.copyWith(
          showRemainingTime: _state.showRemainingTime - 1,
        );
      }else {
        _timer?.cancel();
        _state = _state.copyWith(
          isShowOrder: false,
        );
      }
      notifyListeners();
    });
  }

  void clearWrong() async {
    _state = _state.copyWith(
      isWrong: false,
    );
    notifyListeners();
  }

  void showOrder() async {
    if(_state.hint > 0) {
      _state = _state.copyWith(
        hint: _state.hint - 1,
        showRemainingTime: 5,
        isShowOrder: true,
      );
    }else {
      _state = _state.copyWith(
        isHintAdWatched: true,
        showRemainingTime: 5,
        isShowOrder: true,
      );
    }
    notifyListeners();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if(_state.showRemainingTime > 0) {
        _state = _state.copyWith(
          showRemainingTime: _state.showRemainingTime - 1,
        );
      }else {
        _timer?.cancel();
        _state = _state.copyWith(
          isShowOrder: false,
        );
      }
      notifyListeners();
    });
  }

  void addBonusLife() async {
    _state = _state.copyWith(
      life: 1,
      isLifeAdWatched: true,
    );
  }

  void onColorTap(Color color) async {
    final int selectedIndex = _state.userSelection!.length;
    if(color == _state.randomOrder![selectedIndex]) {
      _state = _state.copyWith(
        userSelection: [
          ..._state.userSelection!,
          color,
        ],
        isWrong: false,
        //score: _state.score + 10, //todo score
      );
      final updatedShuffledOrder = _state.shuffledOrder!.map((colorOption) {
        if (colorOption.color == color && colorOption.order == null) {
          return colorOption.copyWith(order: selectedIndex + 1);
        }
        return colorOption;
      }).toList();
      _state = _state.copyWith(shuffledOrder: updatedShuffledOrder);
    }else {
      if(_state.life > 1) {
        _state = _state.copyWith(
          isWrong: true,
          life: _state.life - 1,
        );
      }else {
        stopGame();
      }
    }
    if(_state.userSelection!.length == _state.randomOrder!.length) {
      _state = _state.copyWith(
        isCorrect: true,
        score: _state.score + 10,
      );
    }
    notifyListeners();
  }

  void stopGame() async {
    _state = _state.copyWith(
      isStarted: false,
    );
    _gameEndController.add(_state.score);
  }

  Future<void> updateRecord(int colorGroup) async {
    final record = await _recordRepository.getRecord();
    if(record != null) {
      switch(colorGroup) {
        case 0:
          final newRecord = record.copyWith(
            classic: _state.score,
          );
          await _recordRepository.saveRecord(newRecord);
          break;
        case 1:
          final newRecord = record.copyWith(
            pastel: _state.score,
          );
          await _recordRepository.saveRecord(newRecord);
          break;
        case 2:
          final newRecord = record.copyWith(
            neon: _state.score,
          );
          await _recordRepository.saveRecord(newRecord);
          break;
        case 3:
          final newRecord = record.copyWith(
            vintage: _state.score,
          );
          await _recordRepository.saveRecord(newRecord);
          break;
      }
    }
  }

  void _loadRecord(int colorGroup) async {
    int bestScore = 0;
    final record = await _recordRepository.getRecord();
    if(record != null) {
      switch(colorGroup) {
        case 0:
          bestScore = record.classic;
          break;
        case 1:
          bestScore = record.pastel;
          break;
        case 2:
          bestScore = record.neon;
          break;
        case 3:
          bestScore = record.vintage;
          break;
      }
    }else {
      const newRecord = Record(
        classic: 0,
        pastel: 0,
        neon: 0,
        vintage: 0,
      );
      await _recordRepository.saveRecord(newRecord);
    }
    _state = _state.copyWith(
      bestScore: bestScore,
    );
    notifyListeners();
  }

}