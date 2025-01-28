import 'package:color_order_match/presentation/components/common_text_button.dart';
import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  final int score;
  final int bestScore;
  final VoidCallback onCancelPressed;
  final VoidCallback onAcceptPressed;
  final bool isAdWatched;

  const GameOverDialog({
    required this.score,
    required this.bestScore,
    required this.onCancelPressed,
    required this.onAcceptPressed,
    required this.isAdWatched,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Game Over',
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
            'Watch an ad and get a life',
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
          children: isAdWatched ? [
            CommonTextButton(
              text: 'Go Home',
              color: Colors.black87,
              onPressed: onCancelPressed,
            ),
          ] :[
            CommonTextButton(
              text: 'Cancel',
              color: Colors.black87,
              onPressed: onCancelPressed,
            ),
            CommonTextButton(
              text: 'Accept',
              color: Colors.black87,
              onPressed: onAcceptPressed,
            ),
          ],
        ),
      ],
    );
  }
}
