import 'package:flutter/material.dart';

class CircleInkWell extends StatelessWidget {
  final double size;
  final Color color;
  final Color colorActiveIcon;
  final IconData iconData;
  final VoidCallback? onPressed;

  const CircleInkWell(this.iconData,
      {required this.color, this.size = 32.0, required this.onPressed, required this.colorActiveIcon});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
              width: 48,
              height: 48,
              child: Icon(
                iconData,
                color: color,
                size: size,
              )),
        ),
      ),
    );
  }
}
