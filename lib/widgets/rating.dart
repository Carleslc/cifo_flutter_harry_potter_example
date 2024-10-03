import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.value, this.onSelect});

  final double value;

  final Function(int value)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          GestureDetector(
            onTap: () => onSelect?.call(i + 1),
            child: Icon(
              value > i + 0.5 ? Icons.star : Icons.star_border,
              size: 30,
            ),
          ),
      ],
    );
  }
}
