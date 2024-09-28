import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/slot/slot_bloc.dart';
import 'package:soil_flutter/blocs/slot/slot_state.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocConsumer<SlotBloc, SlotState>(
      listener: (BuildContext context, SlotState state) {  },
      builder: (BuildContext context, SlotState state) {
        return Center(
          child: Text(
            'Upcoming Page',
            style: TextStyle(
              color: colorScheme.onPrimary,
            ),
          ),
        );
      },
    );
  }
}