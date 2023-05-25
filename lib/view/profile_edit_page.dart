import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/model/user.dart';
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
        _buildFullName(context),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    ProfileEditViewModel viewModel = Provider.of<ProfileEditViewModel>(
      context,
      listen: false,
    );
    return BackButton(
      onPressed: () {
        viewModel.openSettingsPage(context);
      },
    );
  }

  Widget _buildFullName(BuildContext context) {
    return AuthTextField(
      title: User.fullNameKey,controller:_fullNameController ,
    );
  }

}
