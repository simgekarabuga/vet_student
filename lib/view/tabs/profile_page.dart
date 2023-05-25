import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/generated/l10n.dart';

import 'package:vet_student/tools/assets.dart';
import 'package:vet_student/tools/color_helper.dart';

import 'package:vet_student/view_model/tabs_view_model/profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

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
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        _buildImagesBody(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _buildProfileDetail(context),
        _buildDivider(),
        _buildSpecialImages(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        _buildProducts(context),
      ],
    );
  }

  Widget _buildImagesBody(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        _buildBackgroundImage(context),
        _buildProfileImage(context),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.14,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorHelper.imageCircleColor,
            border: Border.all(
              width: 2,
              color: ColorHelper.imageCircleColor,
            ),
          ),
          child: ClipOval(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) => buildBottomSheel(context),
                );
              },
              child: Consumer<ProfileViewModel>(
                builder: (context, viewModel, child) =>
                    viewModel.user?.imageUrl != null
                        ? Image.network(viewModel.user!.imageUrl)
                        : viewModel.image != null
                            ? Image.file(
                                File(viewModel.image!.path),
                                fit: BoxFit.cover,
                              )
                            : Image.asset(Assets.userLogo),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheel(
    BuildContext context,
  ) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(
      context,
      listen: false,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            viewModel.addImage(context, ImageSource.gallery);
          },
          child: Text(S.of(context).galery),
        ),
        TextButton(
          onPressed: () {
            viewModel.addImage(context, ImageSource.camera);
          },
          child: Text(S.of(context).camera),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.999,
              height: MediaQuery.of(context).size.height * 0.17,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.999,
                height: MediaQuery.of(context).size.height * 0.17,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) => buildBottomSheel(context),
                    );
                  },
                  child: Consumer<ProfileViewModel>(
                    builder: (context, viewModel, child) =>
                        viewModel.user?.imageUrl != null
                            ? Image.network(viewModel.user!.imageUrl)
                            : viewModel.image != null
                                ? Image.file(
                                    File(viewModel.image!.path),
                                    fit: BoxFit.fitWidth,
                                  )
                                : Image.asset(Assets.userBackgroundImage),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget _buildProfileDetail(BuildContext context) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "efghj",
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "sfjgkflsöş",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            alignment: Alignment.topRight,
            onPressed: () {
              viewModel.openSettingsPage(context);
            },
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: ColorHelper.imageCircleColor,
    );
  }

  Widget _buildSpecialImages(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: _buildSpecialImagesList,
      ),
      height: MediaQuery.of(context).size.height * 0.25,
    );
  }

  Widget _buildSpecialImagesList(BuildContext context, int index) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (builder) => buildBottomSheelForSpecialPics(context),
          );
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Consumer<ProfileViewModel>(
              builder: (context, viewModel, child) =>
                  viewModel.user?.imageUrl != null
                      ? Image.network(viewModel.user!.imageUrl)
                      : viewModel.image != null
                          ? Image.file(
                              File(viewModel.image!.path),
                              fit: BoxFit.fitHeight,
                            )
                          : Image.asset(
                              Assets.specialImagesBackgroundImage,
                              fit: BoxFit.fitHeight,
                            ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheelForSpecialPics(
    BuildContext context,
  ) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(
      context,
      listen: false,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            viewModel.addImageForSpecialPics(context, ImageSource.gallery);
          },
          child: Text(S.of(context).galery),
        ),
        TextButton(
          onPressed: () {
            viewModel.addImageForSpecialPics(context, ImageSource.camera);
          },
          child: Text(S.of(context).camera),
        ),
      ],
    );
  }

  Widget _buildProducts(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.500,
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        scrollDirection: Axis.vertical,
        itemCount: 30,
        itemBuilder: _buildProductsGridItem,
      ),
    );
  }

  Widget _buildProductsGridItem(BuildContext context, int index) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
      ),
    );
  }
}