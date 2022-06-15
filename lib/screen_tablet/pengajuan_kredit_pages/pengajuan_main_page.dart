import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/user_controller.dart';
import '../../util/style.dart';


class CreditSubmission extends StatefulWidget {
  const CreditSubmission({Key? key}) : super(key: key);

  @override
  _CreditSubmissionState createState() => _CreditSubmissionState();
}

class _CreditSubmissionState extends State<CreditSubmission> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    UserDashboardController _userController = Get.put(UserDashboardController());
    var cred = _userController.credential;

    var newValue;
    const pendidikan = [
      "SD", "SMP", "SMA", "D1", "D2", "D3", "D4", "S1", "S2", "Doktor"
    ];

    var Value;
    const pekerjaan = [
      "Bidan", "Buruh Pabrik", "Dokter", "Guru", "Karyawan", "Kondektur", "Masinis", "Nelayan", "Pegawai BUMN",
      "Pemadam Kebakaran", "Perawat", "PNS", "Polisi", "Supir", "Wirausaha",
    ];

    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Form Pengajuan Kredit", style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _width*0.4,
                          height: _width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.idCard, size: 20, color: Colors.grey),
                              SizedBox(height: 10),
                              Text("Foto KTP",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey, fontSize: 15)),
                            ],
                          ),
                        ),

                        Container(
                          width: _width*0.4,
                          height: _width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.solidUser, size: 20, color: Colors.grey),
                              SizedBox(height: 10),
                              Text("Selfie dengan KTP", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 15)),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        labelText: "Nomor Handphone",
                        hintText: "Masukkan nomor HP aktif",
                        hintStyle: TextStyle(fontSize: 12, color:Colors.grey[400]),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                          child: FaIcon(FontAwesomeIcons.user, size: 20),
                        ),
                      ),
                      onChanged: (value) {
                        cred.value.phoneNumber = value;
                      },
                      style: TextStyle(color:kTextColor, fontSize: 12),
                      onSaved: (value){
                        cred.value.phoneNumber = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Isi nomor handphone";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 15),

                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        labelText: "Nama Ibu Kandung",
                        hintText: "Ibu kandung sesuai KK",
                        hintStyle: TextStyle(fontSize: 12, color:Colors.grey[400]),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                          child: FaIcon(FontAwesomeIcons.user, size: 20),
                        ),
                      ),
                      onChanged: (value) {
                        cred.value.motherName = value;
                      },
                      style: TextStyle(color:kTextColor, fontSize: 12),
                      onSaved: (value){
                        cred.value.motherName = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Isi nama ibu kandung";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 15),

                    Container(
                      width: _width,
                      height: 65,
                      padding: EdgeInsets.only(left: 20, right: 25),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: kTextColor),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration.collapsed(hintText: ""),
                          menuMaxHeight: 200,
                          iconSize: 15,
                          borderRadius: BorderRadius.circular(35),
                          iconEnabledColor: Colors.grey,
                          hint: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('Pendidikan Terakhir', style: TextStyle(fontSize: 12)),
                          ),
                          onChanged: (changedValue) {
                            newValue = changedValue!;
                            setState(() {
                              if(newValue == 'SD'){
                                cred.value.status = 'SD';
                              } else if(newValue == 'SMP'){
                                cred.value.status = 'SMP';
                              } else if(newValue == 'SMA'){
                                cred.value.status = 'SMA';
                              } else if(newValue == 'D1'){
                                cred.value.status = 'D1';
                              } else if(newValue == 'D2'){
                                cred.value.status = 'D2';
                              } else if(newValue == 'D3'){
                                cred.value.status = 'D3';
                              } else if(newValue == 'D4'){
                                cred.value.status = 'D4';
                              } else if(newValue == 'S1'){
                                cred.value.status = 'S1';
                              } else if(newValue == 'S2'){
                                cred.value.status = 'S2';
                              } else if(newValue == 'Doktor'){
                                cred.value.status = 'Doktor';
                              } else {
                                cred.value.status = 'NULL';
                              }
                              newValue;
                              print(newValue);
                            });
                          },
                          value: newValue,
                          validator: (value) => value!.isEmpty ? 'Pilih pendidikan terakhir' : null,
                          items: pendidikan.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(value, style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    Container(
                      width: _width,
                      height: 65,
                      padding: EdgeInsets.only(left: 20, right: 25),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: kTextColor),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration.collapsed(hintText: ""),
                          borderRadius: BorderRadius.circular(35),
                          menuMaxHeight: 200,
                          iconSize: 15,
                          iconEnabledColor: Colors.grey,
                          hint: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('Pekerjaan Terakhir', style: TextStyle(fontSize: 12)),
                          ),
                          onChanged: (changedValue) {
                            Value = changedValue!;
                            setState(() {
                              if(Value == 'Bidan'){
                                cred.value.roles = 'Bidan';
                              } else if(Value == 'Buruh Pabrik'){
                                cred.value.roles = 'Buruh Pabrik';
                              } else if(Value == 'Dokter'){
                                cred.value.roles = 'Dokter';
                              } else if(Value == 'Guru'){
                                cred.value.roles = 'Guru';
                              } else if(Value == 'Karyawan'){
                                cred.value.roles = 'Karyawan';
                              } else if(Value == 'Kondektur'){
                                cred.value.roles = 'Kondektur';
                              } else if(Value == 'Masinis'){
                                cred.value.roles = 'Masinis';
                              } else if(Value == 'Nelayan'){
                                cred.value.roles = 'Nelayan';
                              } else if(Value == 'Pegawai BUMN'){
                                cred.value.roles = 'Pegawai BUMN';
                              } else if(Value == 'Pemadam Kebakaran'){
                                cred.value.roles = 'Pemadam Kebakaran';
                              } else if(Value == 'Perawat'){
                                cred.value.roles = 'Perawat';
                              } else if(Value == 'PNS'){
                                cred.value.roles = 'PNS';
                              } else if(Value == 'Polisi'){
                                cred.value.roles = 'Polisi';
                              } else if(Value == 'Supir'){
                                cred.value.roles = 'Supir';
                              } else if(Value == 'Wirausaha'){
                                cred.value.roles = 'Wirausaha';
                              } else {
                                cred.value.roles = 'Null';
                              }
                              Value;
                              print(Value);
                            });
                          },
                          value: Value,
                          validator: (value) => value!.isEmpty ? 'Pilih pekerjaan terakhir' : null,
                          items: pekerjaan.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(value, style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        labelText: "Pendapatan",
                        hintText: "Pendapatan per Bulan",
                        hintStyle: TextStyle(fontSize: 12, color:Colors.grey[400]),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                          child: FaIcon(FontAwesomeIcons.user, size: 20),
                        ),
                      ),
                      onChanged: (value) {
                        cred.value.bank = value;
                      },
                      style: TextStyle(color:kTextColor, fontSize: 12),
                      onSaved: (value){
                        cred.value.bank = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Isi pendapatan per bulan";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 15),
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

