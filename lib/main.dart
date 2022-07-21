import 'package:flutter/material.dart';
import 'package:krss/bloc/dashboard_controller.dart';
import 'package:krss/bloc/rab_controller.dart';
import 'package:krss/bloc/user_controller.dart';
import 'package:krss/screen_mobile/RAB/mobile_RAB.dart';
import 'package:krss/screen_mobile/accountpages/components/avatar.dart';
import 'package:krss/screen_mobile/accountpages/components/profile.dart';
import 'package:krss/screen_mobile/accountpages/components/registrasi.dart';
import 'package:krss/screen_mobile/mainpages/daftar_toko_bangunan.dart';
import 'package:krss/screen_mobile/mainpages/fasilitator.dart';
import 'package:krss/screen_mobile/mainpages/informasi_kredit.dart';
import 'package:krss/screen_mobile/mainpages/mobile_home.dart';
import 'package:krss/screen_mobile/mainpages/mobile_main_page.dart';
import 'package:krss/screen_mobile/mainpages/tukang.dart';
import 'package:krss/screen_mobile/pengajuan_kredit_pages/main_page_pengajuan.dart';
import 'package:krss/screen_mobile/store_pages/location/map_screen.dart';
import 'package:krss/screen_mobile/store_pages/store_main_page.dart';
import 'package:krss/util/theme.dart';
import 'package:get/get.dart';

import 'bloc/login_controller.dart';

void main() {
  runApp(const MyApp());
  Get.put(LoginController());
  Get.put(DashboardController());
  Get.put(RABController());
  Get.put(UserDashboardController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 180),
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(name: '/home', page: () => const Mobile_Dashboard()),
        GetPage(name: '/pengajuan_kredit', page: () => const CreditSubmission()),
        GetPage(name: '/rab', page: () => const RAB()),
        GetPage(name: '/store_page', page: () => const StorePage()),
        GetPage(name: '/map_screen', page: () => const MapScreen()),
        GetPage(name: '/registration', page: () => const Registration()),
        GetPage(name: '/edit_profile', page: () => const EditProfile()),
        GetPage(name: '/avatar', page: () => const AvatarChange()),
        GetPage(name: '/rab/rab_form', page: () => const RABForm()),
        GetPage(name: '/information_credit', page: () => const InformationCredit()),
        GetPage(name: '/daftar_toko', page: () => const DaftarTokoBangunan()),
        GetPage(name: '/tfl', page: () => const FasilitatorDashboard()),
        GetPage(name: '/tukang', page: () => const DaftarTukangDashboard()),
      ],
      title: 'KRSS',
      theme: theme(),
      home: Mobile_MainPage(),
    );
  }
}