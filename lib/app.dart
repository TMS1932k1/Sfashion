import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:s_fashion/src/config/themes/themes.dart';
import 'package:s_fashion/src/localization/l10n.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_bloc.dart';
import 'package:s_fashion/src/modules/auth/screen/auth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/modules/home/logic/arrival_product/arrival_product_bloc.dart';
import 'package:s_fashion/src/modules/home/logic/category/category_bloc.dart';
import 'package:s_fashion/src/modules/home/logic/event/event_sale_bloc.dart';
import 'package:s_fashion/src/modules/home/screen/home_screen.dart';
import 'package:s_fashion/src/modules/logic/auth/auth_reponse_cubit.dart';
import 'package:s_fashion/src/modules/logic/auth/auth_reponse_state.dart';
import 'package:s_fashion/src/modules/logic/localization/set_locale_cubit.dart';
import 'package:s_fashion/src/modules/logic/localization/set_locale_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SetLocaleCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => AuthReponseCubit()),
        BlocProvider(create: (context) => EventSaleBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => ArrivalProductBloc()),
      ],
      child: BlocBuilder<SetLocaleCubit, SetLocaleState>(
        builder: (context, loacleState) => MaterialApp(
          title: 'SFashion',
          debugShowCheckedModeBanner: false,
          theme: XTheme.light(),
          darkTheme: XTheme.dark(),
          home: const SafeArea(child: HomeScreen()),
          locale: loacleState.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
