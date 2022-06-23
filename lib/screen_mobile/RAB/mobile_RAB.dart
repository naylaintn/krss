import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../util/style.dart';

class RAB extends StatelessWidget {
  const RAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          title: Text("Rencana Anggaran Biaya (RAB)", style: TextStyle(color: kTextColor, fontSize: 18)),
        ),
        body: Container(
          width: _width,
          height: _height,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            children: [
              RABTable(),
            ],
          ),
        ),
      ),
    );
  }
}

class RABTable extends StatefulWidget {
  const RABTable({Key? key}) : super(key: key);

  @override
  State<RABTable> createState() => _RABTableState();
}

class _RABTableState extends State<RABTable> {
  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: _width,
          height: 70,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            border: Border(
              top: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey)
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: _width*0.2,
                child: Text("Item", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ),

              SizedBox(
                width: _width*0.2,
                child: Text("Harga Satuan", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ),

              SizedBox(
                width: _width*0.15,
                child: Text("Qty.", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ),

              SizedBox(
                width: _width*0.25,
                child: Text("Total", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        GestureDetector(
          onTap: (){
            Get.bottomSheet(
              Container(
                width: _width,
                height: _height*0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35)),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  children: [

                  ],
                ),
              ),
            );
          },
          child: SizedBox(
            width: _width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.circlePlus, size: 15, color: kPrimaryColor),
                SizedBox(width: 10),
                Text("Tambah Item", style: TextStyle(fontSize: 15, color: kPrimaryColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GetBottomSheet extends StatelessWidget {
  const GetBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

      ],
    );
  }
}


