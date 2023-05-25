import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/tools/assets.dart';
import 'package:vet_student/tools/color_helper.dart';
import 'package:vet_student/view/common/auth_button.dart';
import 'package:vet_student/view/common/auth_text_field.dart';
import 'package:vet_student/view_model/login_view_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        _buildLoginText(context),
        _buildLoginForm(context),
        _buildOtherOptions(context),
      ],
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Text(
          S.of(context).loginText,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorHelper.standardColor,
        ),
        height: MediaQuery.of(context).size.height * 0.33,
        width: MediaQuery.of(context).size.width * 0.82,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AuthTextField(
                  label: S.of(context).registerEmail,
                  controller: _emailController),
              AuthTextField(
                  label: S.of(context).registerPassword,
                  controller: _passwordController),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              _buildAuthButton(context),
              _buildTransitionText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtherOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 35, right: 40),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorHelper.standardColor,
        ),
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.80,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Consumer<LoginViewModel>(
            builder: (context, viewModel, child) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialButton(
                  context,
                  Assets.googleLogo,
                  S.of(context).loginGoogleButton,
                  () {
                    viewModel.signInWithGoogle();
                  },
                ),
                _buildSocialButton(
                  context,
                  Assets.appleLogo,
                  S.of(context).loginAppleButton,
                  () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String image,
    String title,
    void Function()? onPressed,
  ) {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 20,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: ColorHelper.buttonTextColor,
            ),
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
        shape: StadiumBorder(),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildAuthButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(
      context,
      listen: false,
    );
    return AuthButton(
      title: S.of(context).loginAuthButtonText,
      onPressed: () {
        viewModel.signInWithEmailAndPassword(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      },
    );
  }

  Widget _buildTransitionText(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(
      context,
      listen: false,
    );
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: ColorHelper.richTextColor),
          children: [
            TextSpan(text: S.of(context).loginTransitionText),
            TextSpan(
              text: S.of(context).loginTransitionText2,
              style: TextStyle(
                color: ColorHelper.basicBlue,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        viewModel.openRegisterPage(context);
      },
    );
  }
}
