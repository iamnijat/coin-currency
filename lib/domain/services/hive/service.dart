part of hive_service;

class HiveService {
  late Box currencyViewBox;
  late Box currencyHistoryViewBox;

  Future<void> initHiveService() async {
    /// getting application document directory
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    final appDocumentPath = appDocumentDirectory.path;

    /// initialize [HiveAdapter] logic
    Hive.init(appDocumentPath);

    /// register CurrencyViewModelAdapter component
    Hive.registerAdapter(CurrencyViewModelAdapter());

    /// register CurrencyViewModelAdapter component
    Hive.registerAdapter(CurrencyHistoryModelAdapter());

    /// opening CurrencyViewBox component
    currencyViewBox = await Hive.openBox('currency_view_box');

    /// opening CurrencyConversionHistoryBox component
    currencyHistoryViewBox = await Hive.openBox('currency_history_box');
  }

  Future<void> storeCachedCurrenciesWithDate(
          String date, List<CurrencyViewModel?>? value) async =>
      await currencyViewBox.put(date, value);

  Future<void> storeCurrenciesToHistoryWithKey(
          List<CurrencyHistoryModel?>? value) async =>
      await currencyHistoryViewBox.put('history', value);

  fetchCachedCurrenciesWithDate(String date) =>
      currencyViewBox.get(date, defaultValue: <CurrencyViewModel>[]);

  fetchCurrenciesHistoryWithKey() => currencyHistoryViewBox
      .get('history', defaultValue: <CurrencyHistoryModel>[]);

  bool checkDateIsCached(String date) => currencyViewBox.containsKey(date);

  bool checkHistoryIsNotEmpty() =>
      currencyHistoryViewBox.containsKey('history');

  /// Closing Hive Service
  void close() {
    Hive.close();
  }
}
