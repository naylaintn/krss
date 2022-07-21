import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../util/style.dart';

class DaftarTokoBangunan extends StatelessWidget {
  const DaftarTokoBangunan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    var newValue;
    const provinsi = [
      'Aceh', 'DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur',
    ];

    var newValue2;
    const kabupatenKota = [
      'Kota Bekasi', 'Kabupaten Bekasi', 'Kota Bandung', 'Kota Jakarta Timur'
    ];

    var newValue3;
    const kecamatan = [
      'Kec.Rawalumbu'
    ];

    var newValue4;
    var kelurahanDesa = [
      '',
    ];

    var newValue5;
    var entry = [
      '50', '100', '150', '200', '300',
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          title: Text("Daftar Toko Bangunan", style: TextStyle(color: kTextColor, fontSize: 18)),
        ),
        body: Container(
          height: _height,
          color: scaffoldColor,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: _width,
                height: 60,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        borderRadius: BorderRadius.circular(35),
                        menuMaxHeight: 300,
                        iconSize: 20,
                        iconEnabledColor: Colors.grey,
                        hint: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Provinsi', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        ),
                        onChanged: (changedValue){
                          newValue = changedValue!;

                          newValue;
                          print(newValue);
                        },
                        onSaved: (changedValue) {
                          newValue = changedValue!;
                          newValue;
                          print(newValue);
                        },
                        value: newValue,
                        items: provinsi.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
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
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: _width,
                height: 60,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        borderRadius: BorderRadius.circular(35),
                        menuMaxHeight: 300,
                        iconSize: 20,
                        iconEnabledColor: Colors.grey,
                        hint: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Kabupaten/Kota', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        ),
                        onChanged: (changedValue){
                          newValue2 = changedValue!;

                          newValue2;
                          print(newValue2);
                        },
                        onSaved: (changedValue) {
                          newValue2 = changedValue!;
                          newValue2;
                          print(newValue2);
                        },
                        value: newValue2,
                        items: kabupatenKota.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
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
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: _width,
                height: 60,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        borderRadius: BorderRadius.circular(35),
                        menuMaxHeight: 300,
                        iconSize: 20,
                        iconEnabledColor: Colors.grey,
                        hint: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Kecamatan', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        ),
                        onChanged: (changedValue){
                          newValue3 = changedValue!;

                          newValue3;
                          print(newValue3);
                        },
                        onSaved: (changedValue) {
                          newValue3 = changedValue!;
                          newValue3;
                          print(newValue3);
                        },
                        value: newValue3,
                        items: kecamatan.map((String value) {
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
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: _width,
                height: 60,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration.collapsed(hintText: ''),
                        borderRadius: BorderRadius.circular(35),
                        menuMaxHeight: 300,
                        iconSize: 20,
                        iconEnabledColor: Colors.grey,
                        hint: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Kelurahan/Desa', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        ),
                        onChanged: (changedValue){
                          newValue4 = changedValue!;

                          newValue4;
                          print(newValue4);
                        },
                        onSaved: (changedValue) {
                          newValue4 = changedValue!;
                          newValue4;
                          print(newValue4);
                        },
                        value: newValue4,
                        items: kelurahanDesa.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
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
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: _width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: _width*0.3,
                      height: 50,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        child: Center(
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            decoration: InputDecoration.collapsed(hintText: ''),
                            borderRadius: BorderRadius.circular(10),
                            menuMaxHeight: 300,
                            iconSize: 20,
                            iconEnabledColor: Colors.grey,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Entry', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                            ),
                            onChanged: (changedValue){
                              newValue5 = changedValue!;

                              newValue5;
                              print(newValue5);
                            },
                            onSaved: (changedValue) {
                              newValue5 = changedValue!;
                              newValue5;
                              print(newValue5);
                            },
                            value: newValue5,
                            items: entry.map((String value) {
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
                    ),


                    Flexible(
                      child: SizedBox(
                        width: _width*0.6,
                        height: 40,
                        child: TextField(
                          style: TextStyle(color:Colors.grey[900], fontSize: 12),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(35)),
                              borderSide: BorderSide(color: kTextColor),
                              gapPadding: 10,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(35)),
                              borderSide: BorderSide(color: kTextColor),
                              gapPadding: 10,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(35)),
                              borderSide: BorderSide(color: kTextColor),
                              gapPadding: 10,
                            ),
                            prefixIcon: Icon(Icons.search, size: 12, color: kTextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: _width*1.5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text("No.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                        ),
                        DataColumn(
                          label: Text("Kode Toko", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                        ),
                        DataColumn(
                          label: Text("Nama Toko", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                        ),
                        DataColumn(
                          label: Text("Provinsi", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
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
                              DataCell(Text(items[index].no, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                              DataCell(Text(items[index].kode, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                              DataCell(Text(items[index].nama, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                              DataCell(Text(items[index].provinsi, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemInfo {
  String no;
  String kode;
  String nama;
  String provinsi;

  ItemInfo({
    required this.no,
    required this.kode,
    required this.nama,
    required this.provinsi,
  });
}

var items = <ItemInfo>[
  ItemInfo(
    no: '1',
    kode: 'c.14',
    nama: 'Balai Litbangkes Aceh',
    provinsi: 'Aceh',
  ),
  ItemInfo(
    no: '2',
    kode: 'c.93',
    nama: 'Serba Bangunan',
    provinsi: 'Aceh',
  ),
  ItemInfo(
    no: '2',
    kode: 'c.107',
    nama: 'Toko Bangunan ABC',
    provinsi: 'Aceh',
  ),
];
