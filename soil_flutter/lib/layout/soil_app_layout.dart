import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/navbar/navbar_bloc.dart';
import 'package:soil_flutter/blocs/theme/theme_bloc.dart';
import 'package:soil_flutter/screens/home_screen.dart';
import 'package:iconly/iconly.dart';

class SoilAppLayout extends StatelessWidget {
  const SoilAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(
                "Soil",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  height: 0.0
                ),
              ),
              Text(
                "SPACES",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 8.0,
                  height: 0.0
                ),
              ),
            ],
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: colorScheme.onPrimary,
              ),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconlyLight.search,
              color: colorScheme.onPrimary,
            ),
            onPressed: (){},
          ),
        ],
      ),
      drawer: Drawer(
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
          ],
        ),
      ),
      body: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          switch (state.selectedIndex) {
            case 0:
              return const HomeScreen();
            case 1:
              return const EventsPage();
            case 2:
              return const SipsPage();
            case 3:
              return const UpcomingPage();
            case 4:
              return const ProfilePage();
            default:
              return const HomeScreen();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (index) => context.read<NavbarBloc>().add(NavbarPageChanged(index: index)),
            currentIndex: state.selectedIndex,
            selectedItemColor: colorScheme.primary,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: colorScheme.onPrimary,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.home),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.calendar),
                  label: "Events"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.bag),
                  label: "Sips"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.time_circle),
                  label: "Upcoming"
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.profile),
                  label: "Profile"
              ),
            ],
          );
        },
      ),
    );
  }
}


class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Events Page'),
    );
  }
}

class SipsPage extends StatelessWidget {
  const SipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sips Page'),
    );
  }
}

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Upcoming Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}