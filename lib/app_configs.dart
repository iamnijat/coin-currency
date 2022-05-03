import 'dart:async';
import 'dart:io';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'config/constants/palette.dart';
import 'domain/services/get_it/index.dart';
import 'domain/services/hive/index.dart';
import 'logic/providers/app_language_provider.dart';

class AppConfigs {
  static Future<void> config() async {
    WidgetsFlutterBinding.ensureInitialized();
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();

      if (kDebugMode) {
        Fimber.plantTree(DebugTree());
      }

      GetIt getIt = GetIt.instance;
      setupLocator(getIt);
      GetIt.I.get<HiveService>().initHiveService();

      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppPalette.transparentColor,
      ));
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
          .then((_) {
        runApp(
          ChangeNotifierProvider(
              create: (_) => getIt.get<AppLanguageProvider>(),
              child: const MyApp()),
        );
      });
    }, (error, stackTrace) {
      if (error is SocketException) {
        Fimber.e('Socket exception occurred 😥');
      }
      Fimber.e('Error in main thread appeared. 😥',
          ex: error, stacktrace: stackTrace);
    });
  }
}
