import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/tools/color_helper.dart';
import 'package:vet_student/view_model/main_view_model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildShoppingSection(context),
            _buildMessagingSection(context),
          ],
        ),
      ],
    );
  }

  Widget _buildShoppingSection(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return GestureDetector(
      onTap: () {
        viewModel.openShoppingPage(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorHelper.backgroundColor,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child:
            Text(S.of(context).mainSectionText, style: TextStyle(fontSize: 20)),
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.40,
      ),
    );
  }

  Widget _buildMessagingSection(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return GestureDetector(
      onTap: () {
        viewModel.openMessagePage(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorHelper.backgroundColor,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          S.of(context).mainSectionText2,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.40,
      ),
    );
  }
}
