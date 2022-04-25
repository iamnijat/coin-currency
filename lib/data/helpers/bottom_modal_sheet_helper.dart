import 'package:coin_currency/config/constants/palette.dart';
import 'package:coin_currency/logic/blocs/currency_bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../presentation/bottom_modals/index.dart';

void showFromCurrencyBottomModal(
  context,
  AppLocalizations localization,
  CurrencyBloc currencyBloc,
  String? selectedCurrencyName, {
  required bool toConversionBoolean,
}) {
  showModalBottomSheet(
    backgroundColor: AppPalette.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SelectCurrencyModal(
          selectedCurrencyName: selectedCurrencyName,
          localization: localization,
          toConversion: toConversionBoolean,
          currencyBloc: currencyBloc);
    },
  );
}
