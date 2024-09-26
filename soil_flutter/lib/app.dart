import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/blocs/navbar/navbar_bloc.dart';
import 'package:soil_flutter/blocs/theme/theme_bloc.dart';
import 'package:soil_flutter/layout/soil_app_layout.dart';
import 'package:soil_flutter/themes/dark_theme.dart';
import 'package:soil_flutter/themes/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => NavbarBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent
            ),
          );
          return MaterialApp(
            title: 'Soil Workspaces',
            theme: _getThemeData(themeState),
            home: const SoilAppLayout(),
          );
        },
      ),
    );
  }

  ThemeData _getThemeData(ThemeState themeState) {
    switch (themeState) {
      case ThemeState.light:
        return LightTheme.theme;
      case ThemeState.dark:
        return DarkTheme.theme;
    }
  }

// Widget _getHome() {
//   bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
//
//   if (onBoarding != null) {
//     return const HomePage();
//   } else {
//     return const OnBoardingScreen();
//   }
// }
}
