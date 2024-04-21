import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String btnText;
  final VoidCallback pressed;
  const AuthGradientButton({
    super.key,
    required this.btnText,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppPallete.gradient1, AppPallete.gradient2],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
          onPressed: pressed,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(395, 55),
            backgroundColor: AppPallete.transparentColor,
            shadowColor: AppPallete.transparentColor,
          ),
          child: Text(
            btnText,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          )),
    );
  }
}
