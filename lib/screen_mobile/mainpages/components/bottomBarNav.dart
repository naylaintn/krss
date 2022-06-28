import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krss/bloc/dashboard_controller.dart';
import '../../../util/style.dart';

class BottomBarNav extends StatelessWidget {
  const BottomBarNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DashboardController controller = Get.put(DashboardController());

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.2),
            ),
          ]
      ),
      child: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.grey.withOpacity(0.3),
        selectedItemColor: kPrimaryColor,
        onTap: controller.changeTabIndex,
        currentIndex: controller.tabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}

