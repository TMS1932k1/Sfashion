import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:s_fashion/src/config/themes/themes.dart';
import 'package:s_fashion/src/localization/l10n.dart';
import 'package:s_fashion/src/modules/auth/screens/auth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/modules/logic/set_locale_cubit.dart';
import 'package:s_fashion/src/modules/logic/set_locale_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SetLocaleCubit()),
      ],
      child: BlocBuilder<SetLocaleCubit, SetLocaleState>(
        builder: (context, state) => MaterialApp(
          title: 'SFashion',
          debugShowCheckedModeBanner: false,
          theme: XTheme.light(),
          darkTheme: XTheme.dark(),
          home: const SafeArea(child: AuthScreen()),
          locale: state.locale,
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
