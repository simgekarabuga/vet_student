import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/tools/color_helper.dart';
import 'package:vet_student/view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        _buildImages(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        _buildBestSellers(context),
        _buildDivider(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _buildProductTitleText(context),
        _buildProductList(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        _buildDivider(),
        _buildFavorites(context),
      ],
    );
  }

  Widget _buildImages(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) => PageView.builder(
          controller: viewModel.pageController,
          scrollDirection: Axis.horizontal,
          itemBuilder: _buildPageItem,
          itemCount: viewModel.images.length,
        ),
      ),
    );
  }

  Widget _buildPageItem(BuildContext context, int index) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(
      context,
      listen: false,
    );
    String imageUrl = viewModel.currentTabs[index];
    return Image.network(fit: BoxFit.cover, imageUrl);
  }

  Widget _buildBestSellers(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: _buildBestSellersListItem,
      ),
    );
  }

  Widget _buildBestSellersListItem(BuildContext context, int index) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: GestureDetector(
        onTap: () {
          viewModel.openProfileDetailPage(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorHelper.basicBlue,
            borderRadius: BorderRadius.circular(
              60,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.28,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.black54,
    );
  }

  Widget _buildProductTitleText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8),
      child: Text(
        S.of(context).homeProductTitleText,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: _buildProductListGridItem,
      ),
    );
  }

  Widget _buildProductListGridItem(BuildContext context, int index) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(
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
          viewModel.openProfileDetailPage(context);
        },
        child: Container(
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

  Widget _buildFavorites(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 60,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 200,
              crossAxisSpacing: 5,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
            ),
            itemBuilder: _buildFavoritesGridItem),
      ),
    );
  }

  Widget _buildFavoritesGridItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
    );
  }
}
