import 'package:flutter/material.dart';
import 'package:vet_student/tools/color_helper.dart';

class AuthTextField extends StatelessWidget {
  final String? title;
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  AuthTextField({
    Key? key,
    this.title,
    this.label,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null ? _buildTitleText() : SizedBox(),
        _buildTextFormField(context),
      ],
    );
  }

  Widget _buildTitleText() {
    return Text(title ?? '');
  }

  Widget _buildTextFormField(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.055,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(


          labelText: label,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorHelper.authTextFieldHintColor,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
