import 'package:flutter/material.dart';

class CircleName extends StatelessWidget {
  const CircleName({
    super.key,
    required this.name,
    this.size = 46,
    this.fontSize = 20,
    this.color = Colors.blue,
    this.foregroundColor = Colors.white,
  });

  final String name;
  final double size;
  final double fontSize;
  final Color color;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            name[0],
            style: TextStyle(
              color: foregroundColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
