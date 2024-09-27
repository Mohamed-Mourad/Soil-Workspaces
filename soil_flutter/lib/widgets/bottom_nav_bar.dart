import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:soil_flutter/blocs/navbar/navbar_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<NavbarBloc, NavbarState>(
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
    );
  }
}
