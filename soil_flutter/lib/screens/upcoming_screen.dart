import 'package:flutter/material.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Text(
        'Upcoming Page',
        style: TextStyle(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}