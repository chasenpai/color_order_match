import 'dart:async';

import 'package:color_order_match/config/di_setup.dart';
import 'package:color_order_match/presentation/components/game_exit_dialog.dart';
import 'package:color_order_match/presentation/components/game_over_dialog.dart';
import 'package:color_order_match/presentation/components/hint_dialog.dart';
import 'package:color_order_match/presentation/game/game_view_model.dart';
import 'package:color_order_match/presentation/game/screen/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameRoot extends StatefulWidget {
  final int colorGroup;

  const GameRoot({
    required this.colorGroup,
    super.key,
  });

  @override
  State<GameRoot> createState() => _GameRootState();
}

class _GameRootState extends State<GameRoot> {

  late GameViewModel _viewModel;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<GameViewModel>();
    _subscription = _viewModel.gameEndStream.listen((score) {
      if(mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return GameOverDialog(
              score: score,
              bestScore: _viewModel.state.bestScore!,
              isAdWatched: _viewModel.state.isLifeAdWatched,
              onCancelPressed: () async {
                if(_viewModel.state.score > _viewModel.state.bestScore!) {
                  await _viewModel.updateRecord(widget.colorGroup);
                  context.go('/');
                }else {
                  context.go('/');
                }
              },
              onAcceptPressed: () {
                _viewModel.addBonusLife();
                context.pop();
              },
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel.startGame(widget.colorGroup);
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return GameScreen(
          state: _viewModel.state,
          onColorTap: (color) async {
            _viewModel.onColorTap(color);
            if(_viewModel.state.isCorrect) {
              await Future.delayed(const Duration(milliseconds: 1500));
              _viewModel.generateRandomOrder(widget.colorGroup);
            }
            if(_viewModel.state.isWrong) {
              await Future.delayed(const Duration(milliseconds: 1500));
              _viewModel.clearWrong();
            }
          },
          onExitTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return GameExitDialog(
                  score: _viewModel.state.score,
                  bestScore: _viewModel.state.bestScore!,
                  onExitPressed: () async {
                    if(_viewModel.state.score > _viewModel.state.bestScore!) {
                      await _viewModel.updateRecord(widget.colorGroup);
                      context.go('/');
                    }else {
                      context.go('/');
                    }
                  },
                  onContinuePressed: () {
                    context.pop();
                  },
                );
              },
            );
          },
          onShowOrderTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return HintDialog(
                  hint: _viewModel.state.hint,
                  onCancelPressed: () {
                    context.pop();
                  },
                  onAcceptPressed: () {
                    //todo ad
                    _viewModel.showOrder();
                    context.pop();
                  },
                  onConfirmPressed: () {
                    context.pop();
                  },
                  onUseHintPressed: () {
                    _viewModel.showOrder();
                    context.pop();
                  },
                  isAdWatched: _viewModel.state.isHintAdWatched,
                );
              },
            );
          },
        );
      },
    );
  }
}
