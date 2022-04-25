import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'domain/services/navigation/index.dart';
import 'logic/providers/app_language_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguageProvider>(
        builder: (context, lang, _) =>
            Sizer(builder: (context, orientation, deviceType) {
              return MaterialApp(
                title: 'Coin Currency',
                navigatorKey: NavigationService.navigationKey,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
                locale: lang.appLocal,
                initialRoute: NavigationRoutes.splash,
                onGenerateRoute: generateRoute,
              );
            }));
  }
}
