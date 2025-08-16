import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('en'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @introSliderFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'Lively foreign currency exchange rates'**
  String get introSliderFirstTitle;

  /// No description provided for @introSliderFirstDesc.
  ///
  /// In en, this message translates to:
  /// **'It can be easily used with lively currency rates and cached currencies which is possible without Internet'**
  String get introSliderFirstDesc;

  /// No description provided for @introSliderSecondTitle.
  ///
  /// In en, this message translates to:
  /// **'Currency Exchange Rates Calculator'**
  String get introSliderSecondTitle;

  /// No description provided for @introSliderSecondDesc.
  ///
  /// In en, this message translates to:
  /// **'Exchange icon will make your job easier to convert currency values'**
  String get introSliderSecondDesc;

  /// No description provided for @introSliderThirdTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Options'**
  String get introSliderThirdTitle;

  /// No description provided for @introSliderThirdDesc.
  ///
  /// In en, this message translates to:
  /// **'We have 4 language options and thanks to this, you can be more familiar with Coin Currency'**
  String get introSliderThirdDesc;

  /// No description provided for @introSliderFourthTitle.
  ///
  /// In en, this message translates to:
  /// **'Activity Tracker'**
  String get introSliderFourthTitle;

  /// No description provided for @introSliderFourthDesc.
  ///
  /// In en, this message translates to:
  /// **'The conversions you did will be placed in cached currencies data and you can view them without Internet connection'**
  String get introSliderFourthDesc;

  /// No description provided for @introSliderLetsStartButtonText.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start'**
  String get introSliderLetsStartButtonText;

  /// No description provided for @calculatorPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get calculatorPageTitle;

  /// No description provided for @exceedInputLimitInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'To proceed at least one digit must be removed'**
  String get exceedInputLimitInfoTitle;

  /// No description provided for @exceedInputLimitInfoButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get exceedInputLimitInfoButtonTitle;

  /// No description provided for @currencyHistoryPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Conversions'**
  String get currencyHistoryPageTitle;

  /// No description provided for @currencyLanguagesPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get currencyLanguagesPageTitle;

  /// No description provided for @languageConfirmationDialogButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get languageConfirmationDialogButtonTitle;

  /// No description provided for @languageConfirmationDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Changed'**
  String get languageConfirmationDialogTitle;

  /// No description provided for @languageConfirmationDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'You\'ll enjoy using the app with different languages'**
  String get languageConfirmationDialogDesc;

  /// No description provided for @currencyHistoryNoDataTitle.
  ///
  /// In en, this message translates to:
  /// **'You have not converted any currencies yet'**
  String get currencyHistoryNoDataTitle;

  /// No description provided for @errorPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Error!'**
  String get errorPageTitle;

  /// No description provided for @errorPageDesc.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, Please try again later'**
  String get errorPageDesc;

  /// No description provided for @errorPageRetryButtonText.
  ///
  /// In en, this message translates to:
  /// **'RETRY'**
  String get errorPageRetryButtonText;

  /// No description provided for @englishLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// No description provided for @russianLanguage.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russianLanguage;

  /// No description provided for @turkishLanguage.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkishLanguage;

  /// No description provided for @azeriLanguage.
  ///
  /// In en, this message translates to:
  /// **'Azerbaijani'**
  String get azeriLanguage;

  /// No description provided for @currencyUSDName.
  ///
  /// In en, this message translates to:
  /// **'USA dollar'**
  String get currencyUSDName;

  /// No description provided for @currencyEURName.
  ///
  /// In en, this message translates to:
  /// **'Euro'**
  String get currencyEURName;

  /// No description provided for @currencyAUDName.
  ///
  /// In en, this message translates to:
  /// **'Australia dollar'**
  String get currencyAUDName;

  /// No description provided for @currencyARSName.
  ///
  /// In en, this message translates to:
  /// **'Argentine peso'**
  String get currencyARSName;

  /// No description provided for @currencyBYNName.
  ///
  /// In en, this message translates to:
  /// **'Belarusian ruble'**
  String get currencyBYNName;

  /// No description provided for @currencyBRLName.
  ///
  /// In en, this message translates to:
  /// **'Brazilian real'**
  String get currencyBRLName;

  /// No description provided for @currencyAEDName.
  ///
  /// In en, this message translates to:
  /// **'UAE dirham'**
  String get currencyAEDName;

  /// No description provided for @currencyZARName.
  ///
  /// In en, this message translates to:
  /// **'South African rand'**
  String get currencyZARName;

  /// No description provided for @currencyKRWName.
  ///
  /// In en, this message translates to:
  /// **'South Korean won'**
  String get currencyKRWName;

  /// No description provided for @currencyCZKName.
  ///
  /// In en, this message translates to:
  /// **'Czech Kruna'**
  String get currencyCZKName;

  /// No description provided for @currencyCLPName.
  ///
  /// In en, this message translates to:
  /// **'Chilean Peso'**
  String get currencyCLPName;

  /// No description provided for @currencyCNYName.
  ///
  /// In en, this message translates to:
  /// **'Chinese Yuan'**
  String get currencyCNYName;

  /// No description provided for @currencyDKKName.
  ///
  /// In en, this message translates to:
  /// **'Danish Krone'**
  String get currencyDKKName;

  /// No description provided for @currencyGELName.
  ///
  /// In en, this message translates to:
  /// **'Georgian Lari'**
  String get currencyGELName;

  /// No description provided for @currencyHKDName.
  ///
  /// In en, this message translates to:
  /// **'Hong Kong Dollar'**
  String get currencyHKDName;

  /// No description provided for @currencyINRName.
  ///
  /// In en, this message translates to:
  /// **'Indian Rupee'**
  String get currencyINRName;

  /// No description provided for @currencyGBPName.
  ///
  /// In en, this message translates to:
  /// **'Pound Sterling'**
  String get currencyGBPName;

  /// No description provided for @currencyIDRName.
  ///
  /// In en, this message translates to:
  /// **'Indonesian Rupiah'**
  String get currencyIDRName;

  /// No description provided for @currencyIRRName.
  ///
  /// In en, this message translates to:
  /// **'Iranian Rial'**
  String get currencyIRRName;

  /// No description provided for @currencySEKName.
  ///
  /// In en, this message translates to:
  /// **'Swedish Krona'**
  String get currencySEKName;

  /// No description provided for @currencyCHFName.
  ///
  /// In en, this message translates to:
  /// **'Swiss Frank'**
  String get currencyCHFName;

  /// No description provided for @currencyILSName.
  ///
  /// In en, this message translates to:
  /// **'Israeli New Shekel'**
  String get currencyILSName;

  /// No description provided for @currencyCADName.
  ///
  /// In en, this message translates to:
  /// **'Canadian Dollar'**
  String get currencyCADName;

  /// No description provided for @currencyKWDName.
  ///
  /// In en, this message translates to:
  /// **'Kuwaiti Dinar'**
  String get currencyKWDName;

  /// No description provided for @currencyKZTName.
  ///
  /// In en, this message translates to:
  /// **'Kazakhstani Tenge'**
  String get currencyKZTName;

  /// No description provided for @currencyKGSName.
  ///
  /// In en, this message translates to:
  /// **'Kyrgystani Som'**
  String get currencyKGSName;

  /// No description provided for @currencyLBPName.
  ///
  /// In en, this message translates to:
  /// **'Lebanese pound'**
  String get currencyLBPName;

  /// No description provided for @currencyMYRName.
  ///
  /// In en, this message translates to:
  /// **'Malaysian Ringgit'**
  String get currencyMYRName;

  /// No description provided for @currencyMXNName.
  ///
  /// In en, this message translates to:
  /// **'Mexican Peso'**
  String get currencyMXNName;

  /// No description provided for @currencyMDLName.
  ///
  /// In en, this message translates to:
  /// **'Moldovan Leu'**
  String get currencyMDLName;

  /// No description provided for @currencyEGPName.
  ///
  /// In en, this message translates to:
  /// **'Egyptian Pound'**
  String get currencyEGPName;

  /// No description provided for @currencyNOKName.
  ///
  /// In en, this message translates to:
  /// **'Norwegian Krone'**
  String get currencyNOKName;

  /// No description provided for @currencyUZSName.
  ///
  /// In en, this message translates to:
  /// **'Uzbekistani Som'**
  String get currencyUZSName;

  /// No description provided for @currencyPLNName.
  ///
  /// In en, this message translates to:
  /// **'Poland złoty'**
  String get currencyPLNName;

  /// No description provided for @currencyRUBName.
  ///
  /// In en, this message translates to:
  /// **'Russian Ruble'**
  String get currencyRUBName;

  /// No description provided for @currencySGDName.
  ///
  /// In en, this message translates to:
  /// **'Singapore Dollar'**
  String get currencySGDName;

  /// No description provided for @currencySARName.
  ///
  /// In en, this message translates to:
  /// **'Saudi Riyal'**
  String get currencySARName;

  /// No description provided for @currencyTRYName.
  ///
  /// In en, this message translates to:
  /// **'Turkish lira'**
  String get currencyTRYName;

  /// No description provided for @currencyTWDName.
  ///
  /// In en, this message translates to:
  /// **'Taiwan dollar'**
  String get currencyTWDName;

  /// No description provided for @currencyTJSName.
  ///
  /// In en, this message translates to:
  /// **'Tajikistani Somoni'**
  String get currencyTJSName;

  /// No description provided for @currencyTMTName.
  ///
  /// In en, this message translates to:
  /// **'Turkmenistani manat'**
  String get currencyTMTName;

  /// No description provided for @currencyUAHName.
  ///
  /// In en, this message translates to:
  /// **'Ukrainian hryvnia'**
  String get currencyUAHName;

  /// No description provided for @currencyJPYName.
  ///
  /// In en, this message translates to:
  /// **'Japanese Yen'**
  String get currencyJPYName;

  /// No description provided for @currencyNZDName.
  ///
  /// In en, this message translates to:
  /// **'New Zealand Dollar'**
  String get currencyNZDName;

  /// No description provided for @currencyAZNName.
  ///
  /// In en, this message translates to:
  /// **'Azerbaijani Manat'**
  String get currencyAZNName;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['az', 'en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az':
      return AppLocalizationsAz();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
