import 'package:coin_currency/domain/services/shared_preferences/index.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/widgets.dart';

class AppLanguageProvider extends ChangeNotifier {
  final SharedPreferencesService _preferencesService;

  AppLanguageProvider(this._preferencesService) {
    fetchLocale();
  }

  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;

  Future<void> fetchLocale() async {
    await _preferencesService.getLanguageCode().then((value) {
      Fimber.d(
          'Current Localization Language ✝️ ${_appLocale.toString().toUpperCase()}');
      if (value == null) {
        _appLocale = const Locale('en');
        return;
      }
      _appLocale = Locale(value.toString());
    });
  }

  Future<void> changeLanguage(Locale _locale) async {
    if (_appLocale == _locale) {
      return;
    }
    _appLocale = _locale;
    Fimber.d(
        'Localization Language Has Been Changed To 🥇 ${_appLocale.toString().toUpperCase()}');
    await _preferencesService.setLanguageCode(_locale.languageCode);
    notifyListeners();
  }
}
