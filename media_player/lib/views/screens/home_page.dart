import 'package:flutter/material.dart';
import 'package:media_player/controller/page_controller.dart';
import 'package:provider/provider.dart';

class tabBar extends StatefulWidget {
  const tabBar({super.key});

  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    MyTabController.tabController = TabController(
      length: 5,
      vsync: this,
    );
  }

  Widget build(BuildContext context) {
    return Consumer<MyTabController>(
      builder: (context, Provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Media Player App"),
            bottom: TabBar(
              splashFactory: NoSplash.splashFactory,
              controller: MyTabController.tabController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              isScrollable: true,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                color: MyTabController.tabController == Provider.pageController
                    ? Colors.white
                    : Colors.primaries[Provider.getIndex % 18],
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: (index) {
                Provider.pageChange(index: index);
              },
              tabs: Provider.Tab.map(
                (e) => SizedBox(
                  width: 100,
                  height: 40,
                  child: Center(
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Provider.Tab.indexOf(e) == Provider.getIndex
                            ? Colors.white
                            : Colors.black,
                        fontWeight: Provider.Tab.indexOf(e) == Provider.getIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: Provider.Tab.indexOf(e) == Provider.getIndex
                            ? 18
                            : 15,
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
            centerTitle: true,
          ),
          body: PageView(
            allowImplicitScrolling: false,
            controller: Provider.pageController,
            children: List.generate(
              5,
              (index) => Container(
                color: Colors.primaries[index % 18],
              ),
            ),
          ),
        );
      },
    );
  }
}
