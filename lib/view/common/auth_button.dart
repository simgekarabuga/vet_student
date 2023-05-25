import 'package:flutter/material.dart';
import 'package:vet_student/tools/color_helper.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const AuthButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.zero,
        /*backgroundColor: */
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ColorHelper.authButtonBackgroundGradientColor1,
              ColorHelper.authButtonBackgroundGradientColor2,
            ],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorHelper.standardColor,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
