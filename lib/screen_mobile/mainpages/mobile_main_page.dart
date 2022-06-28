import 'package:flutter/material.dart';
import 'package:krss/bloc/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:krss/screen_mobile/accountpages/mobile_account_main.dart';
import 'package:krss/screen_mobile/mainpages/mobile_home.dart';

import 'components/bottomBarNav.dart';

class Mobile_MainPage extends StatelessWidget {
  const Mobile_MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<DashboardController>(
      builder: (controller){
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                Mobile_Dashboard(),
                Container(),
                AccountPage(),
              ],
            ),

            bottomNavigationBar: BottomBarNav(),
          ),
        );
      },
    );
  }
}
