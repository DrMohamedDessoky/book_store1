import 'package:bookia/core/sevices/local_services/shared_prefs_helper.dart';
import 'package:bookia/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SharedPrefsHelper.init();

  runApp(MyApp());
}
