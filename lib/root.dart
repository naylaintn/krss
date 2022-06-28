import 'package:flutter/material.dart';
import 'package:krss/screen_desktop/mainpages/desktop_main_page.dart';
import 'package:krss/screen_mobile/mainpages/mobile_main_page.dart';
import 'package:krss/screen_tablet/mainpages/tablet_main_page.dart';
import '/util/screen_size.dart' as screen_size;

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        if(screen_size.getScreenSize(constraints.maxWidth) == screen_size.ScreenSize.verySmall
            && screen_size.getScreenSize(constraints.maxWidth) == screen_size.ScreenSize.small
            && screen_size.getScreenSize(constraints.maxWidth) == screen_size.ScreenSize.mediumSmall){
          return Mobile_MainPage();
        } else if (screen_size.getScreenSize(constraints.maxWidth) == screen_size.ScreenSize.medium
            && screen_size.getScreenSize(constraints.maxWidth) == screen_size.ScreenSize.mediumLarge){
          return Tablet_MainPage();
        } else {
          return Desktop_MainPage();
        }
      },
    );
  }
}
