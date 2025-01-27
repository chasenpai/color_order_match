import 'package:color_order_match/ui/ui_colors.dart';
import 'package:flutter/material.dart';

class ColorGroupButton extends StatefulWidget {
  final String groupName;
  final List<Color> colors;
  final VoidCallback onPressed;

  const ColorGroupButton({
    required this.groupName,
    required this.colors,
    required this.onPressed,
    super.key,
  });

  @override
  State<ColorGroupButton> createState() => _ColorGroupButtonState();
}

class _ColorGroupButtonState extends State<ColorGroupButton> {

  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final containerWidth = (width - 120 - 16) / 2;
    final tileWidth = ((width - 180 - 16) / 2 - 12) / 2;
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
        width: containerWidth,
        height: containerWidth + 28,
        decoration: BoxDecoration(
          color: _isPressed ? lightGrey : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ColorTile(
                  width: tileWidth,
                  color: widget.colors[0],
                ),
                const SizedBox(width: 12.0,),
                _ColorTile(
                  width: tileWidth,
                  color: widget.colors[1],
                ),
              ],
            ),
            const SizedBox(height: 12.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ColorTile(
                  width: tileWidth,
                  color: widget.colors[2],
                ),
                const SizedBox(width: 12.0,),
                _ColorTile(
                  width: tileWidth,
                  color: widget.colors[3],
                ),
              ],
            ),
            const SizedBox(height: 12.0,),
            Text(
              widget.groupName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  final double width;
  final Color color;

  const _ColorTile({
    required this.width,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );
  }
}

