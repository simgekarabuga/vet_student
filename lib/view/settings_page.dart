import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/tools/color_helper.dart';
import 'package:vet_student/view_model/settings_view_model.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);




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
    SettingsViewModel viewModel = Provider.of<SettingsViewModel>(
      context,
      listen: false,
    );
    return Align(
      alignment: Alignment.topLeft,
      child: BackButton(onPressed: () {
        viewModel.onBackPressed(
          context,
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildBackButton(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        _buildAccountButtons(context),
      ],
    );
  }

  Widget _buildAccountButtons(BuildContext context) {
    SettingsViewModel viewModel = Provider.of<SettingsViewModel>(
      context,
      listen: false,
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorHelper.borderColor,
          width: 2,
        ),
      ),
      padding: EdgeInsets.only(
        top: 30,
      ),
      height: MediaQuery.of(context).size.height * 0.38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 2,
          ),
          _buildAccountContainer(
            context,
            onPressed: () {
              viewModel.openProfileHeadersPage(context);
            },
            S.of(context).profileDetail,
          ),
          SizedBox(
            height: 2,
          ),
          _buildAccountContainer(
            context,
            onPressed: () {},
            S.of(context).profileSettingsAccount,
          ),
          SizedBox(
            height: 2,
          ),
          _buildAccountContainer(
            context,
            onPressed: () {},
            S.of(context).profileSettingsSingOut,
          ),
          SizedBox(
            height: 2,
          ),
          _buildAccountContainer(
            context,
            onPressed: () {},
            S.of(context).profileSettingsSingOut,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountContainer(BuildContext context, String title,
      {void Function()? onPressed}) {
    return OutlinedButton(onPressed: onPressed,style: ButtonStyle(),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

    );
  }
}
