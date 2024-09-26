import 'package:flutter/material.dart';

class ItemSeparator extends StatelessWidget {
  const ItemSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        const SizedBox(height: 8.0,),
        Container(
          width: double.infinity,
          height: 2.0,
          color: colorScheme.tertiary,
        ),
        const SizedBox(height: 8.0,),
      ],
    );
  }
}
