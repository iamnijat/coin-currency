import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../presentation/dialogs/index.dart';

void showExceedInputLimitInfoDialog({
  required BuildContext context,
  required AppLocalizations localization,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => ExceedInputLimitInfoDialog(
      localization: localization,
    ),
  );
}

Future showLanguageChangeConfirmationDialog({
  required BuildContext context,
  required AppLocalizations localization,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => LanguageChangeConfirmationDialog(
      localization: localization,
    ),
  );
}
