import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/theme/theme_bloc.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Soil",
                  style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 34.0,
                      height: 0.0
                  ),
                ),
                Text(
                  "SPACES",
                  style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 12.0,
                      height: 0.0
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return ListTile(
                  title: Text(
                    'Dark mode',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  leading: Icon(
                    Icons.dark_mode_rounded,
                    color: colorScheme.onPrimary,
                  ),
                  trailing: Switch(
                    value: state == ThemeState.dark,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(ThemeEvent.toggleTheme);
                    },
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.black54,
                  ),
                );
              }
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: colorScheme.onPrimary,
                ),
              ),
              leading: Icon(
                Icons.settings,
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
