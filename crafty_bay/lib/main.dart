import 'package:crafty_bay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/crafty_bay_app.dart';

// Firebase set up
// Crashlytics set up
// Analytics set up
// Provider set up
// Localization set up
// Architecture Design
// Theming set up

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CraftyBayApp());
}
