import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/app/app.dart';
import 'package:life_pattern/firebase_options.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized before any async work.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for Android.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Forward Flutter framework errors to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Forward async errors (e.g. from Futures/Streams) to Crashlytics.
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Run the app inside a ProviderScope for Riverpod.
  runApp(const ProviderScope(child: LifePatternApp()));
}
