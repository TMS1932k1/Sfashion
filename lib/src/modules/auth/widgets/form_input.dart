import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/modules/auth/widgets/dropdown_language.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      padding: const EdgeInsets.all(Properties.kPaddingSmall),
      decoration: BoxDecoration(
        color: MyColors.colorWhile.withOpacity(0.8),
        borderRadius: BorderRadius.circular(
          Properties.kPaddingLarge,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.login.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const DropDownLanguage(),
            ],
          ),
        ],
      ),
    );
  }
}
