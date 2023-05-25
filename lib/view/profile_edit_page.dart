import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/model/user.dart';
import 'package:vet_student/view/common/auth_button.dart';
import 'package:vet_student/view/common/auth_text_field.dart';
import 'package:vet_student/view_model/profile_edit_view_model.dart';

class ProfileEditPage extends StatelessWidget {
  ProfileEditPage({Key? key}) : super(key: key);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(
          context,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildBackButton(context),
        _buildTextFieldsColumn(context),
        _buildSaveButton(context),
      ],
    );
  }

  Widget _buildTextFieldsColumn(BuildContext context) {
    return Consumer<ProfileEditViewModel>(
      builder: (context, viewModel, child) {
        _initTextFields(context);
        return Column(
          children: [
            _buildFullName(context),
            _buildDescription(context),
          ],
        );
      },
    );
  }

  void _initTextFields(BuildContext context) {
    ProfileEditViewModel viewModel = Provider.of<ProfileEditViewModel>(
      context,
      listen: false,
    );
    _fullNameController.text = viewModel.user?.fullName ?? '';
    _descriptionController.text = viewModel.user?.description ?? '';
  }

  Widget _buildBackButton(BuildContext context) {
    ProfileEditViewModel viewModel = Provider.of<ProfileEditViewModel>(
      context,
      listen: false,
    );
    return Align(
      alignment: Alignment.bottomLeft,
      child: BackButton(
        onPressed: () {
          viewModel.onBackPressed(context);
        },
      ),
    );
  }

  Widget _buildFullName(BuildContext context) {
    return AuthTextField(
      title: User.fullNameKey,
      controller: _fullNameController,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return AuthTextField(
      controller: _descriptionController,
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    ProfileEditViewModel viewModel = Provider.of<ProfileEditViewModel>(
      context,
      listen: false,
    );
    return AuthButton(
      title: "kaydet",
      onPressed: () {
        viewModel.updateProfile(
          _fullNameController.text.trim(),
          _descriptionController.text.trim(),
        );
      },
    );
  }
}
