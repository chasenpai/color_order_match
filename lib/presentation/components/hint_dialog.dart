import 'package:color_order_match/presentation/components/common_text_button.dart';
import 'package:flutter/material.dart';

class HintDialog extends StatelessWidget {
  final int hint;
  final VoidCallback onCancelPressed;
  final VoidCallback onAcceptPressed;
  final VoidCallback onConfirmPressed;
  final VoidCallback onUseHintPressed;
  final bool isAdWatched;

  const HintDialog({
    required this.hint,
    required this.onCancelPressed,
    required this.onAcceptPressed,
    required this.onConfirmPressed,
    required this.onUseHintPressed,
    required this.isAdWatched,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        hint > 0 ? 'Show Order?' : 'Out of Hints',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You have $hint hints',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6.0,),
          Text(
              !isAdWatched && hint == 0
              ? 'All hints are used. Watch an ad to get one more hint.'
              : isAdWatched && hint == 0
              ? 'No hints left, and no more ads available.'
              : 'Do you want to see the color order again? consume one hint.',
            textAlign: TextAlign.center,
            style: const TextStyle(
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
          children: !isAdWatched && hint == 0 ? [
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
          ] : isAdWatched && hint == 0 ? [
            CommonTextButton(
              text: 'Confirm',
              color: Colors.black87,
              onPressed: onConfirmPressed,
            ),
          ] : [
            CommonTextButton(
              text: 'Cancel',
              color: Colors.black87,
              onPressed: onCancelPressed,
            ),
            CommonTextButton(
              text: 'Use Hint',
              color: Colors.black87,
              onPressed: onUseHintPressed,
            ),
          ],
        ),
      ],
    );
  }
}
