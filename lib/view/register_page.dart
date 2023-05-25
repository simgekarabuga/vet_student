import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/tools/color_helper.dart';
import 'package:vet_student/view/common/auth_button.dart';
import 'package:vet_student/view/common/auth_text_field.dart';
import 'package:vet_student/view_model/register_view_model.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        _buildRegisterText(context),
        _buildRegisterForm(context),
      ],
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Text(
        S.of(context).registerText,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.60,
        width: MediaQuery.of(context).size.width * 0.82,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AuthTextField(
                label: S.of(context).registerNameSurname,
                controller: _fullNameController,
              ),
              AuthTextField(
                label: S.of(context).registerEmail,
                controller: _emailController,
              ),
              AuthTextField(
                label: S.of(context).registerPhoneNum,
                controller: _phoneNumController,
              ),
              AuthTextField(
                label: S.of(context).registerPassword,
                controller: _passwordController,
              ),
              _buildTermsOfUseRow(context),
              _buildAuthButton(context),
              _buildTransitionText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButton(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(
      context,
      listen: false,
    );
    return AuthButton(
      title: S.of(context).registerAuthButtonText,
      onPressed: () {
        FormState? formState = _formKey.currentState;
        if (formState != null) {
          formState.validate();
        }
        viewModel.signUpWithEmailAndPassword(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _fullNameController.text.trim(),
          _phoneNumController.text.trim(),
        );
      },
    );
  }

  Widget _buildTransitionText(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(
      context,
      listen: false,
    );
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: ColorHelper.richTextColor,
          ),
          children: [
            TextSpan(
              text: S.of(context).registerTransitionText,
            ),
            TextSpan(
              text: S.of(context).registerTransitionText2,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        viewModel.openLoginPage(context);
      },
    );
  }

  Widget _buildTermsOfUseRow(BuildContext context) {
    return Row(
      children: [
        Consumer<RegisterViewModel>(
          builder: (context, viewModel, child) => Checkbox(
            value: viewModel.isTermsOfUseAccepted,
            onChanged: (bool? newValue) {
              if (newValue != null) {
                viewModel.isTermsOfUseAccepted = newValue;
              }
            },
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(color: ColorHelper.buttonTextColor),
            children: [
              TextSpan(text: S.of(context).termsOfUse1),
              TextSpan(
                text: S.of(context).termsOfUse2,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: S.of(context).termsOfUse3,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
