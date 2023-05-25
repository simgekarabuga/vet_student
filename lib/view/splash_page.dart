import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/view_model/splash_view_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashViewModel viewModel = Provider.of<SplashViewModel>(
      context,
      listen: false,
    );
    viewModel.checkIsAlreadySignedIn(context);
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
