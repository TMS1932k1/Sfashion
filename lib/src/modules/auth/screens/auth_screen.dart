import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/config/themes/styles.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/auth/widgets/form_input.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.colorTransparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyImages.imgBgAuth),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SFashion',
                style: Style.styleLogo.copyWith(
                  fontSize: 32,
                  color: MyColors.colorWhile,
                ),
              ),
              const SizedBox(height: Properties.kPaddingSmall),
              const FormInput(),
            ],
          ),
        ),
      ),
    );
  }
}
