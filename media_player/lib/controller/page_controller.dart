import 'package:flutter/material.dart';

class MyTabController extends ChangeNotifier {
  static TabController? tabController;

  PageController pageController = PageController();

  get getIndex {
    return tabController?.index ?? 1;
  }

  List Tab = [
    "Chat",
    "Status",
    "Call",
    "Profile",
    "Setting",
  ];

  pageChange({required int index}) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
    notifyListeners();
  }
}
