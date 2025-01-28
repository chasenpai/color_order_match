import 'package:color_order_match/presentation/components/common_text_button.dart';
import 'package:flutter/material.dart';

class GameExitDialog extends StatelessWidget {
  final int score;
  final int bestScore;
  final VoidCallback onExitPressed;
  final VoidCallback onContinuePressed;

  const GameExitDialog({
    required this.score,
    required this.bestScore,
    required this.onExitPressed,
    required this.onContinuePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Time to Go?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Score ${score.toString()}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4.0,),
          Text(
            'Best Score ${bestScore.toString()}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6.0,),
          const Text(
            'Do you want to exit the game?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CommonTextButton(
              text: 'Continue',
              color: Colors.black87,
              onPressed: onContinuePressed,
            ),
            CommonTextButton(
              text: 'Exit',
              color: Colors.black87,
              onPressed: onExitPressed,
            ),
          ],
        ),
      ],
    );
  }
}
