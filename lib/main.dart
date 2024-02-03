import 'dart:io';

import 'app_configs.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await AppConfigs.config();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
