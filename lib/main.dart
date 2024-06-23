import 'package:appauth/app/pages/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const AppAuth());
}

