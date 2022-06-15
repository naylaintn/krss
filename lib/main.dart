import 'package:flutter/material.dart';
import 'package:krss/screen_desktop/mainpages/desktop_main_page.dart';
import 'package:krss/screen_mobile/mainpages/mobile_main_page.dart';
import 'package:krss/screen_tablet/mainpages/tablet_main_page.dart';
import 'package:krss/util/responsive.dart';
import 'package:krss/util/theme.dart';
import 'package:get/get.dart';

import 'bloc/login_controller.dart';

void main() {
  runApp(const MyApp());
  Get.put(LoginController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(name: '/pengajuan_kredit', page: () => const MyApp()),
      ],
      title: 'KRSS',
      theme: theme(),
      home: Responsive(
        Small: Mobile_MainPage(),
        Medium: Tablet_MainPage(),
        Large: Desktop_MainPage(),
      ),
    );
  }
}