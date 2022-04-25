part of get_it;

void setupLocator(GetIt getIt) {
  getIt.registerLazySingleton(() => const NavigationService());
  getIt.registerLazySingleton(() => SharedPreferencesService());
  getIt.registerLazySingleton(() => ServerRepository());
  getIt.registerLazySingleton(() => HiveService());
  getIt.registerLazySingleton(
      () => AppLanguageProvider(GetIt.I.get<SharedPreferencesService>()));
}
