import 'package:flutter/material.dart';
import 'package:media_player/views/component/anynew_Page.dart';
import 'package:media_player/views/component/audio_Page.dart';
import 'package:media_player/views/component/video_Page.dart';

class MyTabController extends ChangeNotifier {
  static TabController? tabController;

  PageController pageController = PageController();

  get getIndex {
    return tabController?.index ?? 1;
  }

  List Tab = [
    "Home",
    "Audio",
    "Video",
  ];

  List<Widget> Pages = [
    anyNewPage(),
    audioPage(),
    videoPage(),
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
