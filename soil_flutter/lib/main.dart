import 'package:flutter/material.dart';
import 'package:soil_flutter/app.dart';
import 'package:soil_flutter/data/shared_preferences.dart';
import 'package:soil_flutter/network/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  await DioHelper.init();

  runApp(const App());
}