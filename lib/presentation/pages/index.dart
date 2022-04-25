library pages;

import 'package:animate_do/animate_do.dart';
import 'package:coin_currency/config/constants/palette.dart';
import 'package:coin_currency/logic/blocs/currency_bloc/currency_bloc.dart';
import 'package:coin_currency/logic/blocs/select_language_page_bloc/select_language_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import '../../config/constants/assets.dart';
import '../../config/constants/styles.dart';
import '../../data/utils/home_nav_pages_data_utility.dart';
import '../../logic/blocs/intro_page_slider_bloc/intro_page_slider_bloc.dart';
import '../../logic/blocs/splash_page_bloc/splash_page_bloc.dart';
import '../../logic/providers/navigation_tab_controller.dart';
import '../widgets/index.dart';

part 'calculator_page.dart';
part 'currency_history_page.dart';
part 'home_page.dart';
part 'intro_page.dart';
part 'languages_page.dart';
part 'splash_page.dart';
part 'error_page.dart';
