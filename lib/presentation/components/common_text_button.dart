import 'package:color_order_match/ui/ui_colors.dart';
import 'package:flutter/material.dart';

class CommonTextButton extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CommonTextButton({
    required this.text,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  State<CommonTextButton> createState() => _CommonTextButtonState();
}

class _CommonTextButtonState extends State<CommonTextButton> {

  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: _isPressed ? lightGrey : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
