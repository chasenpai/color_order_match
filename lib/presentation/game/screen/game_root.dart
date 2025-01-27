import 'dart:async';

import 'package:color_order_match/config/di_setup.dart';
import 'package:color_order_match/presentation/game/game_view_model.dart';
import 'package:color_order_match/presentation/game/screen/game_screen.dart';
import 'package:flutter/material.dart';

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
        );
      },
    );
  }
}
