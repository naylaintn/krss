import 'package:flutter/material.dart';
import 'package:krss/util/global_widget.dart';

import '../../util/style.dart';

class FasilitatorDashboard extends StatelessWidget {
  const FasilitatorDashboard({Key? key}) : super(key: key);

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Fasilitator", style: TextStyle(color: kTextColor, fontSize: 18)),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: [

            Column(
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
              ],
            ),

            const SizedBox(height: 30),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                TFL(
                  title: 'Nama TFL',
                  desc: 'Pengalaman 5 tahun',
                  lokasi: 'Lokasi TFL',
                ),
                TFL(
                  title: 'Nama TFL',
                  desc: 'Pengalaman 5 tahun',
                  lokasi: 'Lokasi TFL',
                ),
                TFL(
                  title: 'Nama TFL',
                  desc: 'Pengalaman 5 tahun',
                  lokasi: 'Lokasi TFL',
                ),
                TFL(
                  title: 'Nama TFL',
                  desc: 'Pengalaman 5 tahun',
                  lokasi: 'Lokasi TFL',
                ),
                TFL(
                  title: 'Nama TFL',
                  desc: 'Pengalaman 5 tahun',
                  lokasi: 'Lokasi TFL',
                ),
                TFL(
                  title: 'Nama TFL',
                  desc: 'Pengalaman 5 tahun',
                  lokasi: 'Lokasi TFL',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TFL extends StatelessWidget {
  String title;
  String desc;
  String lokasi;
  TFL({Key? key, required this.title, required this.desc, required this.lokasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.45,
      height: 250,
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
                    Icons.supervisor_account_rounded, size: 40, color: kTextColor,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: width,
                height: 50,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(title, textAlign: TextAlign.left, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    Text(lokasi, textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                    Text(desc, textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),

              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.add, size: 15, color: kPrimaryColor),
                      label: Text('Pilih', style: TextStyle(fontSize: 12, color: kPrimaryColor)),
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


