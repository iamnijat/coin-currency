part of shared_preferences_service;

class SharedPreferencesService {
  SharedPreferences? _sp;

  Future<SharedPreferences?> _init() async {
    _sp = await SharedPreferences.getInstance();
    return _sp;
  }

  Future<bool?> getIntroPageSeen() async {
    var sp = await _init();
    return sp?.getBool(AppStrings.introPageSeen);
  }

  Future<void> setIntroPageSeen() async {
    final sp = await _init();
    await sp?.setBool(AppStrings.introPageSeen, true);
  }

  Future<String?> getLanguageCode() async {
    var sp = await _init();
    return sp?.getString(AppStrings.storedLanguageCode);
  }

  Future<void> setLanguageCode(String code) async {
    final sp = await _init();
    await sp?.setString(AppStrings.storedLanguageCode, code);
  }
}
