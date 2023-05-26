import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/view/login_page.dart';
import 'package:vet_student/view/profile_detail_page.dart';
import 'package:vet_student/view/profile_edit_page.dart';
import 'package:vet_student/view/register_page.dart';
import 'package:vet_student/view/settings_page.dart';
import 'package:vet_student/view/shopping_page.dart';
import 'package:vet_student/view/tabs/home_page.dart';
import 'package:vet_student/view/tabs/profile_page.dart';
import 'package:vet_student/view_model/home_view_model.dart';
import 'package:vet_student/view_model/login_view_model.dart';

import 'package:vet_student/view_model/profile_detail_view_model.dart';
import 'package:vet_student/view_model/profile_edit_view_model.dart';
import 'package:vet_student/view_model/register_view_model.dart';
import 'package:vet_student/view_model/settings_view_model.dart';
import 'package:vet_student/view_model/shopping_view_model.dart';
import 'package:vet_student/view_model/tabs_view_model/profile_view_model.dart';

class Routes {
  static const String loginPageKey = '/login_page';
  static const String registerPageKey = '/register_page';
  static const String shoppingPageKey = '/shopping_page';
  static const String profileDetailPageKey = '/profile_detail_page';
  static const String homePageKey = '/home_page';
  static const String settingsPageKey = '/settings_page';
  static const String profilePageKey = '/profile_page';
  static const String profileEditPageKey = '/profile_edit_page';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      registerPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => RegisterViewModel(),
            child: RegisterPage(),
          ),
      loginPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => LoginViewModel(),
            child: LoginPage(),
          ),
      shoppingPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => ShoppingViewModel(),
            child: ShoppingPage(),
          ),
      profileDetailPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => ProfileDetailViewModel(),
            child: ProfileDetailPage(),
          ),
      homePageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
            child: HomePage(),
          ),
      settingsPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => SettingsViewModel(),
            child: SettingsPage(),
          ),
      profilePageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => ProfileViewModel(),
            child: ProfilePage(),
          ),
      profileEditPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => ProfileEditViewModel(),
            child: ProfileEditPage(),
          ),
    };
  }
}
