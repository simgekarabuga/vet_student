import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/view_model/profile_detail_view_model.dart';

class ProfileDetailPage extends StatelessWidget {
  ProfileDetailPage({Key? key}) : super(key: key);

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

  Widget _buildBackButton(BuildContext context) {
    ProfileDetailViewModel viewModel = Provider.of<ProfileDetailViewModel>(
      context,
      listen: false,
    );
    return BackButton(
      onPressed: () {
        viewModel.onBackPressed(context);
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildBackButton(context),
      ],
    );
  }
}
