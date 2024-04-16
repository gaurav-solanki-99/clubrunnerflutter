import 'package:club_runner/controller/MainScreenController.dart';
import 'package:club_runner/util/asstes_image/AssetsImage.dart';
import 'package:club_runner/util/my_color/MyColor.dart';
import 'package:club_runner/view/screens/dash_board_screen/DashBoardScreen.dart';
import 'package:club_runner/view/screens/event_screen/EventScreen.dart';
import 'package:club_runner/view/screens/news_screen/NewsScreen.dart';
import 'package:club_runner/view/screens/setting/SettingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/size_config/SizeConfig.dart';
import '../screens/training_screen/TrainingScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var heightPerBox = SizeConfig.blockSizeVerticalHeight;
  var widthPerBox = SizeConfig.blockSizeHorizontalWith;

  MainScreenController msc = Get.put(MainScreenController());

  final List _pages = [
    const DashBoardScreen(),
    const TrainingScreen(),
    const NewsScreen(),
    const EventScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          body: _pages[msc.selectedTab.value],
          bottomNavigationBar: BottomNavigationBar(
           // currentIndex: msc.selectedTab.value,
            onTap: (index) {
              msc.selectedTab.value = index;
              print(">>>>selected tab "+msc.selectedTab.value.toString());
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: MyColor.screen_bg,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  MyAssetsImage.app_home_icon_bottom_nav,
                  color: msc.selectedTab.value == 0? Colors.white : Colors.grey,
                  height: heightPerBox! * 2.3,
                ),
                label: 'Dash',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  MyAssetsImage.app_training_icon_bottom_nav,
                  color: msc.selectedTab.value == 1 ? Colors.white : Colors.grey,
                  height: heightPerBox! * 2.3,
                ),
                label: 'Training',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  MyAssetsImage.app_news_icon_bottom_nav,
                  color: msc.selectedTab.value == 2 ? Colors.white : Colors.grey,
                  height: heightPerBox! * 2.3,
                ),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  MyAssetsImage.app_event_icon_bottom_nav,
                  color: msc.selectedTab.value == 3 ? Colors.white : Colors.grey,
                  height: heightPerBox! * 2.3,
                ),
                label: 'Events',
              ),
            ],
          ),
        ),
      );
    });
  }

}
