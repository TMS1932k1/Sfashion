import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/localization/l10n.dart';
import 'package:s_fashion/src/modules/comon_logic/localization/set_locale_cubit.dart';

class DropDownLanguage extends StatefulWidget {
  const DropDownLanguage({super.key});

  @override
  State<DropDownLanguage> createState() => _DropDownLanguageState();
}

class _DropDownLanguageState extends State<DropDownLanguage> {
  late Locale currentLocale;

  @override
  void initState() {
    super.initState();
    currentLocale = BlocProvider.of<SetLocaleCubit>(context).state.locale;
  }

  void setChangeLocale(Locale? newLocale) {
    if (newLocale == currentLocale || newLocale == null) return;
    setState(() {
      BlocProvider.of<SetLocaleCubit>(context).onChangeLocal(newLocale);
      currentLocale = BlocProvider.of<SetLocaleCubit>(context).state.locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: currentLocale,
      items: L10n.all
          .map<DropdownMenuItem<Locale>>(
            (language) => DropdownMenuItem<Locale>(
              value: language,
              child: Text(
                language.languageCode.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          )
          .toList(),
      onChanged: setChangeLocale,
    );
  }
}