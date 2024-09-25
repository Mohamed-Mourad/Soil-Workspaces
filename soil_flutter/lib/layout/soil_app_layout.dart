import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/navbar/navbar_bloc.dart';
import 'package:soil_flutter/screens/home_screen.dart';
import 'package:iconly/iconly.dart';

class ShopAppLayout extends StatelessWidget {
  const ShopAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: BottomNavigationBar(
              onTap: (index) => context.read<NavbarBloc>().add(NavbarPageChanged(index: index)),
              currentIndex: state.selectedIndex,
              selectedItemColor: colorScheme.primary,
              unselectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
              unselectedIconTheme: const IconThemeData(opacity: 0.0, size: 0),
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
            ),
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