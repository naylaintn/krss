import 'package:flutter/material.dart';
import 'package:krss/util/style.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/location_controller.dart';


class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(LocationController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(),
        body: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Address(),
            ],
          ),
        ),
      ),
    );
  }
}

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: _width,
      height: 70,
      child: InkWell(
        onTap: (){Get.toNamed("/map_screen");},
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          shadowColor: kPrimaryColor.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.locationDot, size: 15, color: Colors.grey[600]),
                SizedBox(width: 20),
                Expanded(
                  child: Text("Pilih Alamat", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
