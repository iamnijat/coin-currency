import '../models/view_model/currency_model/currency_view_model.dart';

class FetchDefaultConversionItem {
  static CurrencyViewModel fetchItem() {
    return CurrencyViewModel(
        code: 'AZN', value: 1.0, name: 'Azərbaycan Manatı', nominal: 1);
  }
}
