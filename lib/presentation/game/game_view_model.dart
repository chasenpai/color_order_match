import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:color_order_match/domain/model/color_option.dart';
import 'package:color_order_match/presentation/game/game_state.dart';
import 'package:color_order_match/ui/ui_colors.dart';
import 'package:flutter/cupertino.dart';

class GameViewModel with ChangeNotifier {

  final Random _random = Random();
  late Timer? _timer;

  GameState _state = const GameState();
  GameState get state => _state;

  final _gameEndController = StreamController<int>();
  Stream<int> get gameEndStream => _gameEndController.stream;

  void startGame(int colorGroup) async {
    generateRandomOrder(colorGroup);
    _state = _state.copyWith(
      isStarted: true,
    );
  }

  void generateRandomOrder(int colorGroup) async {
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
    final List<Color> randomOrder = tmpColors.take(3).toList();
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


  void onColorTap(Color color) async {
    final int selectedIndex = _state.userSelection!.length;
    if (color == _state.randomOrder![selectedIndex]) {
      _state = _state.copyWith(
        userSelection: [
          ..._state.userSelection!,
          color,
        ],
        isWrong: false,
      );
      final updatedShuffledOrder = _state.shuffledOrder!.map((colorOption) {
        if (colorOption.color == color && colorOption.order == null) {
          return colorOption.copyWith(order: selectedIndex + 1);
        }
        return colorOption;
      }).toList();
      _state = _state.copyWith(shuffledOrder: updatedShuffledOrder);
    } else {
      _state = _state.copyWith(
        isWrong: true,
        life: _state.life - 1,
      );
    }
    if (_state.userSelection!.length == _state.randomOrder!.length) {
      _state = _state.copyWith(
        isCorrect: true,
        score: _state.score + 10,
      );
    }
    notifyListeners();
  }

}