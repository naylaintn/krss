import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krss/bloc/login_controller.dart';
import 'package:krss/bloc/rab_controller.dart';
import 'package:krss/model/RAB.dart';
import 'package:krss/util/global_widget.dart';
import 'package:intl/intl.dart';

import '../../util/style.dart';

class RAB extends StatelessWidget {
  const RAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RABController controller = Get.find();
    controller.getRABList();

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
        ),
        body: Container(
          height: _height,
          color: scaffoldColor,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              Column(
                children: [
                  SizedBox(
                    width: _width,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text("Rencana Anggaran Biaya", maxLines:2, textAlign: TextAlign.left, style: TextStyle(color: kTextColor, fontSize: 18, fontWeight: FontWeight.w900)),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed('/rab/rab_form');
                          },
                          child: SizedBox(
                            width: 120,
                            height: 50,
                            child: Card(
                              color: kPrimaryColor,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.circlePlus, size: 12, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("Tambah Item", style: TextStyle(fontSize: 12, color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  rabTable(_width, _height),
                ],
              ),
            ],
          ),
        ),

        bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
              Text("Rp20.000", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget rabTable(double _width, double _height){

  // RABController controller = Get.find();
  // final currencyFormatter = NumberFormat('#,##0', 'ID');

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SizedBox(
      width: _width*1.5,
      child: Card(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text("Nama", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            DataColumn(
              label: Text("Harga", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            DataColumn(
              label: Text("Unit", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            DataColumn(
              label: Text("Total", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            DataColumn(
              label: Text("", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ),
          ],
          rows: List<DataRow>.generate(
              items.length,
                  (int index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (index.isEven) {
                        return kSecondaryLightColor;
                      }
                      return null;
                    }),
                cells: <DataCell>[
                  DataCell(Text(items[index].item, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                  DataCell(Text(items[index].value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                  DataCell(Text(items[index].qty, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                  DataCell(Text(items[index].total, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          splashRadius: 10,
                          icon: const Icon(Icons.edit, size: 12, color: kTextColor,),
                        ),
                        IconButton(
                          onPressed: (){},
                          splashRadius: 10,
                          icon: const Icon(Icons.delete, size: 12, color: Colors.red,),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    ),
  );
}

//-----------------------------------------------------------------------------------------------------------------------------------------------

class RABForm extends StatefulWidget {
  const RABForm({Key? key}) : super(key: key);

  @override
  State<RABForm> createState() => _RABFormState();
}

class _RABFormState extends State<RABForm> {

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final LoginController loginController = Get.find();
    final RABController controller = Get.find();

    CostItem rab = CostItem();

    TextEditingController totalPrice = TextEditingController.fromValue(
        TextEditingValue(text: rab.total.toString(), selection: TextSelection.collapsed(offset: rab.total.toString().length))
    );

    TextEditingController unitPrice = TextEditingController.fromValue(
        TextEditingValue(text: rab.value.toString(), selection: TextSelection.collapsed(offset: rab.value.toString().length))
    );

    TextEditingController Qty = TextEditingController.fromValue(
        TextEditingValue(text: rab.param.toString(), selection: TextSelection.collapsed(offset: rab.param.toString().length))
    );

    String resultTotalPrice = "0";
    totalPrice.text = '${resultTotalPrice}';
    print("address in my view is"+totalPrice.text);


    var newValue;
    const item = [
      'Baja', 'Bata', 'Fondasi', 'Genteng', 'Kaca', 'Kayu/Bambu', 'Keramik',
      'Kerikil/Split', 'Metal', 'Pasir', 'Semen',
    ];

    var newValue2;
    const unit = [
      'kg', 'gr', 'oz',
    ];

    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kTextColor),
          elevation: 0,
          title: Text("RAB Form", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: kTextColor)),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Form(
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
                              onChanged: (changedValue){
                                newValue = changedValue!;
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
                              },
                              onSaved: (changedValue) {
                                newValue = changedValue!;
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
                                rab.value =
                                    int.parse(value);
                              }
                            },
                            onSaved: (value){
                              if(value!.isNum){
                                rab.value =
                                    int.parse(value);
                              }
                            },
                            validator: (value){
                              if(int.parse(value!) is int){
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: 50,
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
                              ),

                              SizedBox(width: 10),

                              Container(
                                width: _width*0.25,
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
                                      child: Text('Unit', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                    ),
                                    onChanged: (changedValue){
                                      newValue2 = changedValue!;
                                      if(newValue2 == 'kg'){
                                        rab.unit=='kg';
                                      } else if(newValue2 == 'gr'){
                                        rab.unit=='gr';
                                      } else if(newValue2 == 'oz'){
                                        rab.unit=='oz';
                                      } else {
                                        rab.name=='';
                                      }
                                      newValue2;
                                      print(newValue);
                                    },
                                    onSaved: (changedValue) {
                                      newValue2 = changedValue!;
                                      if(newValue2 == 'kg'){
                                        rab.unit=='kg';
                                      } else if(newValue2 == 'gr'){
                                        rab.unit=='gr';
                                      } else if(newValue2 == 'oz'){
                                        rab.unit=='oz';
                                      } else {
                                        rab.name=='';
                                      }
                                      newValue2;
                                      print(newValue);
                                    },
                                    value: newValue2,
                                    validator: (value) => value!.isEmpty ? 'Pilih unit' : null,
                                    items: unit.map((String value) {
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
                            Flexible(
                              child: SizedBox(
                                width: _width*0.55,
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
                                    rab.total;
                                  },
                                  onSaved: (value){
                                    resultTotalPrice = value!;
                                    rab.total;
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

                        rab.userId = loginController.check.value.userId;
                        controller.costItem = rab;

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
            ),
          ],
        )
      ),
    );
  }
}

class ItemInfo {
  String item;
  String value;
  String qty;
  String total;

  ItemInfo({
    required this.item,
    required this.value,
    required this.qty,
    required this.total,
  });
}

var items = <ItemInfo>[
  ItemInfo(
    item: 'Semen',
    value: 'Rp1.000',
    qty: '2,00',
    total: 'Rp2.000'
  ),
  ItemInfo(
      item: 'Lantai',
      value: 'Rp2.000',
      qty: '3,00',
      total: 'Rp6.000'
  ),
  ItemInfo(
      item: 'Cat',
      value: 'Rp3.000',
      qty: '4,00',
      total: 'Rp12.000'
  ),
];



