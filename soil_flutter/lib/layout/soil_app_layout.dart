import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/navbar/navbar_bloc.dart';
import 'package:soil_flutter/screens/home_screen.dart';
import 'package:iconly/iconly.dart';
import 'package:soil_flutter/widgets/bottom_nav_bar.dart';
import 'package:soil_flutter/widgets/default_drawer.dart';

class SoilAppLayout extends StatelessWidget {
  const SoilAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
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
      drawer: const DefaultDrawer(),
      body: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          switch (state.selectedIndex) {
            case 0:
              return HomeScreen();
            case 1:
              return const EventsPage();
            case 2:
              return const SipsPage();
            case 3:
              return const UpcomingPage();
            case 4:
              return const ProfilePage();
            default:
              return HomeScreen();
          }
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}


class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Text(
          'Events Page',
        style: TextStyle(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class SipsPage extends StatelessWidget {
  const SipsPage({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Text(
        'Sips Page',
        style: TextStyle(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}

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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Text(
          'Profile Page',
        style: TextStyle(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}