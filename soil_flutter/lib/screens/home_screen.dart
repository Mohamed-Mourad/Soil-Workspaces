import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/workspace/workspace_bloc.dart';
import 'package:soil_flutter/blocs/workspace/workspace_state.dart';
import 'package:soil_flutter/widgets/item_separator.dart';
import 'package:soil_flutter/widgets/workspace_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<WorkspaceBloc, WorkspaceState>(
      builder: (context, state) {
        if (state is WorkspaceLoading) {
          return Center(
              child: CircularProgressIndicator(
                color: colorScheme.onPrimary,
              ),
          );
        } else if (state is WorkspaceLoaded) {
          return ListView.separated(
            itemCount: state.workspaces.length,
            itemBuilder: (context, index) {
              final workspace = state.workspaces[index];
              return WorkspaceCard(workspace: workspace);
            },
            separatorBuilder: (context, index) {
              return const ItemSeparator();
            },
          );
        } else if (state is WorkspaceError) {
          return Center(
              child: Text(
                  state.message
              )
          );
        } else {
          return const Center(
              child: Text(
                  'Something went wrong',
              ),
          );
        }
      },
    );
  }
}
