import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/view_model/message_view_model.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

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
      children: [
        _buildBackButton(context),
      ],
    );
  }
}

Widget _buildBackButton(BuildContext context) {
  MessageViewModel viewModel = Provider.of<MessageViewModel>(
    context,
    listen: false,
  );
  return BackButton(
    onPressed: () {
      viewModel.openMainPage(context);
    },
  );
}
