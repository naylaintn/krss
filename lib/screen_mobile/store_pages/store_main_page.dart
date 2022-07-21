import 'package:flutter/material.dart';
import 'package:krss/util/style.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/location_controller.dart';
import '../../util/global_widget.dart';


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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              Address(),
              const SizedBox(height: 30),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  Store(
                    title: 'Nama Toko',
                    lokasi: 'Lokasi Toko',
                  ),
                  Store(
                    title: 'Nama Toko',
                    lokasi: 'Lokasi Toko',
                  ),
                  Store(
                    title: 'Nama Toko',
                    lokasi: 'Lokasi Toko',
                  ),
                  Store(
                    title: 'Nama Toko',
                    lokasi: 'Lokasi Toko',
                  ),
                  Store(
                    title: 'Nama Toko',
                    lokasi: 'Lokasi Toko',
                  ),
                  Store(
                    title: 'Nama Toko',
                    lokasi: 'Lokasi Toko',
                  ),
                ],
              ),
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

class Store extends StatelessWidget {
  String title;
  String lokasi;
  Store({Key? key, required this.title, required this.lokasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.45,
      height: 220,
      child: Card(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width,
                height: 120,
                decoration: BoxDecoration(
                  color: kSecondaryLightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.storefront, size: 40, color: kTextColor,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: width,
                height: 70,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, textAlign: TextAlign.left, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    Text(lokasi, textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                    Row(
                      children: [
                        Icon(Icons.location_pin, size: 14, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('0.5 KM', textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}