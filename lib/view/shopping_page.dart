import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/tools/assets.dart';
import 'package:vet_student/tools/color_helper.dart';
import 'package:vet_student/view/tabs/cart_page.dart';
import 'package:vet_student/view/tabs/home_page.dart';
import 'package:vet_student/view/tabs/profile_page.dart';
import 'package:vet_student/view_model/home_view_model.dart';
import 'package:vet_student/view_model/shopping_view_model.dart';
import 'package:vet_student/view_model/tabs_view_model/cart_view_model.dart';
import 'package:vet_student/view_model/tabs_view_model/profile_view_model.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final List<Widget> _tabs = [
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: HomePage(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartViewModel(),
      child: CartPage(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: ProfilePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<ShoppingViewModel>(
            builder: (context, viewModel, child) =>
                _tabs[viewModel.currentTabIndex],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    ShoppingViewModel viewModel = Provider.of<ShoppingViewModel>(context);
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < Assets.tabs.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: _buildTabImage(i, viewModel.currentTabIndex),
          label: _getTabLabel(context, i),
          //backgroundColor: ColorHelper.accentLightColor,
        ),
      );
    }
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      //elevation: 16,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: BottomNavigationBar(
        items: items,
        currentIndex: viewModel.currentTabIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: ColorHelper.accentLightColor,
        selectedItemColor: ColorHelper.accentVeryDarkColor,
        unselectedItemColor: ColorHelper.accentPassiveColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        onTap: (int index) {
          viewModel.currentTabIndex = index;
        },
      ),
    );
  }

  Widget _buildTabImage(int index, int currentTabIndex) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Image.asset(
        Assets.tabs[index],
        height: 22,
        fit: BoxFit.fitHeight,
        color: index == currentTabIndex
            ? ColorHelper.primaryColor
            : ColorHelper.accentPassiveColor,
      ),
    );
  }

  String _getTabLabel(BuildContext context, int tab) {
    switch (tab) {
      case 0:
        return S.of(context).tab1;
      case 1:
        return S.of(context).tab2;
      case 2:
        return S.of(context).tab3;
      default:
        return '';
    }
  }
}
