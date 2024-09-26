import 'dart:core';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.radius = 4.0,
    required this.function,
    this.textSize = 16.0,
    this.height = 40.0,
    this.isUpper = true,
  });

  final String text;
  final VoidCallback function;
  final double textSize;
  final double width;
  final double height;
  final double radius;
  final bool isUpper;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: colorScheme.primary
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: textSize,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );;
  }
}