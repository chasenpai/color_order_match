import 'package:color_order_match/ui/ui_colors.dart';
import 'package:flutter/material.dart';

class CommonFlexibleButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;
  final double? minHeight;

  const CommonFlexibleButton({
    required this.text,
    required this.onPressed,
    required this.color,
    required this.fontSize,
    this.minHeight,
    super.key,
  });

  @override
  State<CommonFlexibleButton> createState() => _CommonFlexibleButtonState();
}

class _CommonFlexibleButtonState extends State<CommonFlexibleButton> {

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
        constraints: BoxConstraints(
          minHeight: widget.minHeight != null ? widget.minHeight! : 86.0,
        ),
        decoration: BoxDecoration(
          color: _isPressed ? lightGrey : widget.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 9.0,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
