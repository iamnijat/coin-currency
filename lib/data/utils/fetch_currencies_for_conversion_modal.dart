import 'package:coin_currency/data/utils/check_currencies_codes_localization.dart';

import '../models/view_model/currency_model/currency_selection_model.dart';
import '../models/view_model/currency_model/currency_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FetchCurrenciesForConversionModal {
  static List<CurrencySelectionModel> fetchCurrencies(
    List<CurrencyViewModel> currencyModelList,
    AppLocalizations localization,
    String? currencyCode,
  ) {
    List<CurrencySelectionModel> _currenciesList = <CurrencySelectionModel>[];
    _currenciesList = currencyModelList.map((element) {
      return CurrencySelectionModel(
        code: element.code,
        name: getLocalizedCurrencyName(element.code, localization).toString(),
        nominal: element.nominal,
        value: element.value,
        isSelected: element.code == currencyCode ? true : false,
      );
    }).toList();

    return _currenciesList;
  }
}
