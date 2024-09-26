import 'package:flutter/material.dart';
import 'package:soil_flutter/app.dart';
import 'package:soil_flutter/data/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(const App());
}