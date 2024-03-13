import 'package:firebase_core/firebase_core.dart';
import 'package:flags_app/app/app.dart';
import 'package:flags_app/core/inject/inject.dart';
import 'package:flags_app/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await inject();

  runApp(const App());
}
