import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krss/bloc/rab_controller.dart';
import 'package:krss/model/RAB.dart';
import 'package:krss/util/global_widget.dart';

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

class RABTable extends StatelessWidget {
  const RABTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RABController controller = Get.put(RABController());
    controller.getRABList(controller.RAB.id);

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

        SizedBox(height: 10),

        Obx((){
          return Column(
            children: controller.rabList.map((e) => listCard(e, _width, _height)).toList(),
          );
        }),

        GestureDetector(
          onTap: (){
            Get.bottomSheet(
              Container(
                width: _width,
                height: _height*0.7,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35)),
                ),
                child: SingleChildScrollView(
                  child: GetBottomSheet(),
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


//-----------------------------------------------------------------------------------------------------------------------------------------------

class GetBottomSheet extends StatefulWidget {
  const GetBottomSheet({Key? key}) : super(key: key);

  @override
  State<GetBottomSheet> createState() => _GetBottomSheetState();
}

class _GetBottomSheetState extends State<GetBottomSheet> {

  final _formKey = GlobalKey<FormState>();
  final RABController controller = Get.put(RABController());
  String resultTotalPrice = "0";

  @override
  Widget build(BuildContext context) {

    RABModel rab = controller.RAB;

    TextEditingController totalPrice = TextEditingController.fromValue(
        TextEditingValue(text: rab.price.toString(), selection: TextSelection.collapsed(offset: rab.price.toString().length))
    );

    TextEditingController unitPrice = TextEditingController.fromValue(
        TextEditingValue(text: rab.oldPrice.toString(), selection: TextSelection.collapsed(offset: rab.oldPrice.toString().length))
    );

    TextEditingController Qty = TextEditingController.fromValue(
        TextEditingValue(text: rab.number, selection: TextSelection.collapsed(offset: rab.number.length))
    );

    totalPrice.text = '${resultTotalPrice}';
    print("address in my view is"+totalPrice.text);


    var newValue;
    const item = [
      'Baja', 'Bata', 'Fondasi', 'Genteng', 'Kaca', 'Kayu/Bambu', 'Keramik',
      'Kerikil/Split', 'Metal', 'Pasir', 'Semen',
    ];

    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [

          SizedBox(
            width: _width,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Item Bangunan", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kPrimaryColor)),
                SizedBox(height: 5),
                Container(
                  width: _width,
                  height: 50,
                  padding: EdgeInsets.only(left: 10, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: kTextColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration.collapsed(hintText: ''),
                      borderRadius: BorderRadius.circular(35),
                      menuMaxHeight: 300,
                      iconSize: 20,
                      iconEnabledColor: Colors.grey,
                      hint: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Item Bangunan', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                      ),
                      onChanged: (changedValue) {
                        newValue = changedValue!;
                        setState(() {

                          if(newValue == 'Baja'){
                            rab.name=='Baja';
                          } else if(newValue == 'Bata'){
                            rab.name=='Bata';
                          } else if(newValue == 'Fondasi'){
                            rab.name=='Fondasi';
                          } else if(newValue == 'Genteng'){
                            rab.name=='Genteng';
                          } else if(newValue == 'Kaca'){
                            rab.name=='Kaca';
                          } else if(newValue == 'Kayu/Bambu'){
                            rab.name=='Kayu/Bambu';
                          } else if(newValue == 'Keramik'){
                            rab.name=='Keramik';
                          } else if(newValue == 'Kerikil/Split'){
                            rab.name=='Kerikil/Split';
                          } else if(newValue == 'Metal'){
                            rab.name=='Metal';
                          } else if(newValue == 'Pasir'){
                            rab.name=='Pasir';
                          } else if(newValue == 'Semen'){
                            rab.name=='Semen';
                          } else {
                            rab.name=='';
                          }

                          newValue;
                          print(newValue);

                        });
                      },
                      value: newValue,
                      validator: (value) => value!.isEmpty ? 'Pilih item bangunan' : null,
                      items: item.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            width: _width,
                            child: Row(
                              children: [
                                Text(value),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(
            width: _width,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Harga Satuan", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kPrimaryColor)),
                SizedBox(height: 5),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: unitPrice,
                    style: TextStyle(color:Colors.grey[900], fontSize: 14),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor),
                        gapPadding: 10,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor),
                        gapPadding: 10,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor),
                        gapPadding: 10,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.red),
                        gapPadding: 10,
                      ),
                    ),
                    onChanged: (value) {
                      if(value.isNum){
                        rab.oldPrice =
                        int.tryParse(value)!;
                      }
                    },
                    onSaved: (value){
                      if(value!.isNum){
                        rab.oldPrice =
                        int.tryParse(value)!;
                      }
                    },
                    validator: (value){
                      if(int.tryParse(value!) is int){
                        return null;
                      } else {
                        return "Masukkan harga satuan";
                      }
                    },
                  ),
                ),
              ],
            ),
          ),


          SizedBox(
            width: _width,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Kuantitas", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kPrimaryColor)),
                SizedBox(height: 5),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: Qty,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor),
                        gapPadding: 10,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor),
                        gapPadding: 10,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor),
                        gapPadding: 10,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.red),
                        gapPadding: 10,
                      ),
                    ),
                    onChanged: (value) {
                      rab.number = value;
                    },
                    style: TextStyle(color:Colors.grey[900], fontSize: 14),
                    onSaved: (value){
                      rab.number = value!;
                    },
                    validator: (value){
                      if(value!.isEmpty){
                        return "Masukkan kuantitas item";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),


          SizedBox(
            width: _width,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Total Harga", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kPrimaryColor)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: _width*0.6,
                      height: 70,
                      child: TextFormField(
                        controller: totalPrice,
                        style: TextStyle(color:Colors.grey[900], fontSize: 14),
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: kTextColor),
                            gapPadding: 10,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                            gapPadding: 10,
                          ),
                        ),
                        onChanged: (value) {
                          resultTotalPrice = value;
                        },
                        onSaved: (value){
                          resultTotalPrice = value!;
                        },
                        validator: (value){
                          if(int.tryParse(value!) is int){
                            return null;
                          } else {
                            return "Tekan tombol disamping";
                          }
                        },
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          int totalPriceNumb = (int.parse(unitPrice.text) * int.parse(Qty.text));
                          resultTotalPrice = totalPriceNumb.toString();
                        });
                      },
                      child: Container(
                        width: _width*0.3,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text("TOTAL HARGA", style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          DefaultButton(
            text: 'Simpan',
            press: (){
              if(_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                rab.userId = controller.userid;

                controller.saveRAB();

                Get.snackbar(
                  "Sukses",
                  'Data RAB berhasil ditambahkan',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.white,
                  instantInit: false,
                );

                Get.back();
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget listCard(RABModel rab, double _width, double _height){
  return Container(
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
          child: Text(rab.name, textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ),

        SizedBox(
          width: _width*0.2,
          child: Text(rab.oldPrice.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ),

        SizedBox(
          width: _width*0.15,
          child: Text(rab.number, textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ),

        SizedBox(
          width: _width*0.25,
          child: Text(rab.price.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}



