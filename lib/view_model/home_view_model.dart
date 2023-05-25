import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vet_student/tools/routes.dart';

class HomeViewModel with ChangeNotifier {
  final PageController _pageController = PageController();

  List<String> _images = [
    "https://img.freepik.com/free-photo/aerial-view-business-team_53876-124515.jpg?w=1800&t=st=1683384784~exp=1683385384"
        "~hmac=4b5286c2fbc3d069d02647a18a8cd8b460c53a366c044edf415ecdc9b8594dd3",
    "https://img.freepik.com/free-photo/aerial-view-business-team_53876-124515.jpg?w=1800&t=st=1683384784~exp=1683385384"
        "~hmac=4b5286c2fbc3d069d02647a18a8cd8b460c53a366c044edf415ecdc9b8594dd3",
    "https://img.freepik.com/free-photo/aerial-view-business-team_53876-124515.jpg?w=1800&t=st=1683384784~exp=1683385384"
        "~hmac=4b5286c2fbc3d069d02647a18a8cd8b460c53a366c044edf415ecdc9b8594dd3",
  ];

  List<String> get images => _images;

  PageController get pageController => _pageController;

  var currentTabs = [
    "https://img.freepik.com/free-photo/aerial-view-business-team_53876-124515.jpg?w=1800&t=st=1683384784~exp=1683385384"
        "~hmac=4b5286c2fbc3d069d02647a18a8cd8b460c53a366c044edf415ecdc9b8594dd3",
    "https://img.freepik.com/free-photo/aerial-view-business-team_53876-124515.jpg?w=1800&t=st=1683384784~exp=1683385384"
        "~hmac=4b5286c2fbc3d069d02647a18a8cd8b460c53a366c044edf415ecdc9b8594dd3",
    "https://img.freepik.com/free-photo/aerial-view-business-team_53876-124515.jpg?w=1800&t=st=1683384784~exp=1683385384"
        "~hmac=4b5286c2fbc3d069d02647a18a8cd8b460c53a366c044edf415ecdc9b8594dd3",
  ];

  Timer? timer;

  HomeViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer.periodic(
        Duration(
          milliseconds: 2000,
        ),
        (Timer t) => _changeAd(),
      );
    },);
  }

  void _changeAd() async {
    int? currentPage = _pageController.page?.toInt();

    if (currentPage != null) {
      int nextPage = 0;
      if (currentPage < _images.length - 1) {
        nextPage = currentPage + 1;
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void openProfileDetailPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.profileDetailPageKey);
  }
}
