import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:krss/util/global_widget.dart';
import 'package:krss/util/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../bloc/user_controller.dart';

class CreditSubmission extends StatelessWidget {
  const CreditSubmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          title: Text("Form Pengajuan Kredit", style: TextStyle(color: kTextColor, fontSize: 18)),
        ),
        body: Builder(
          builder: (BuildContext context){
            return Container(
              width: _width,
              height: _height < 800 ? _height*1.5 : _height < 650 ? _height*2 : _height,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                children: [
                  CreditForm(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CreditForm extends StatefulWidget {
  const CreditForm({Key? key}) : super(key: key);

  @override
  State<CreditForm> createState() => _CreditFormState();
}

class _CreditFormState extends State<CreditForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    UserDashboardController _userController = Get.put(UserDashboardController());
    var cred = _userController.credential;
    final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);


    var newValue;
    const education = [
      'SD','SMP','SMA','D1','D2','D3','D4','S1','S2','S3'
    ];

    var Value;
    const jobs = [
      'Bidan', 'Buruh', 'Dokter', 'Guru', 'Karyawan', 'Kepala Sekolah', 'Kondektur', 'Masinis', 'Nelayan',
      'Pegawai BUMN', 'Pemadam Kebakaran', 'Perawat', 'PNS', 'Polisi', 'Supir', 'Tukang', 'Wirausaha', 'Lainnya'
    ];

    double _width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width*0.4,
                height: _width*0.4,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: kTextColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.idCard, size: 20, color: Colors.grey),
                    SizedBox(height: 20),
                    Text("Foto KTP", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                ),
              ),

              Container(
                width: _width*0.4,
                height: _width*0.4,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: kTextColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.camera, size: 20, color: Colors.grey),
                    SizedBox(height: 20),
                    Text("Selfie dengan KTP", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 25),

          TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(text: cred.value.idNumber, selection: TextSelection.collapsed(offset: cred.value.idNumber.length))),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(color: Colors.red),
                gapPadding: 10,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                child: FaIcon(FontAwesomeIcons.idCard, size: 20),
              ),
              labelText: "Nomor KTP",
              hintText: "Isi nomor KTP",
              hintStyle: TextStyle(color:Colors.grey[400]),
              //errorText: "Ketik nama anda",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              cred.value.idNumber = value;
            },
            style: TextStyle(color:Colors.grey[900], fontSize: 14),
            onSaved: (value){
              cred.value.idNumber = value!;
            },
            validator: (value){
              if(value!.isEmpty){
                return "Isi nomor KTP";
              } else {
                return null;
              }
            },
          ), //no.ktp

          SizedBox(height: 15),

          TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(text: cred.value.name, selection: TextSelection.collapsed(offset: cred.value.name.length))),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(color: Colors.red),
                gapPadding: 10,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                child: FaIcon(FontAwesomeIcons.user, size: 20),
              ),
              labelText: "Nama Lengkap",
              hintText: "Isi nama lengkap sesuai KTP",
              hintStyle: TextStyle(color:Colors.grey[400]),
              //errorText: "Ketik nama anda",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              cred.value.name = value;
            },
            style: TextStyle(color:Colors.grey[900], fontSize: 14),
            onSaved: (value){
              cred.value.name = value!;
            },
            validator: (value){
              if(value!.isEmpty){
                return "Isi nama lengkap";
              } else {
                return null;
              }
            },
          ), //nama lengkap

          SizedBox(height: 15),

          TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(text: cred.value.pob, selection: TextSelection.collapsed(offset: cred.value.pob.length))),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(color: Colors.red),
                gapPadding: 10,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                child: FaIcon(FontAwesomeIcons.mapLocation, size: 20),
              ),
              labelText: "Tempat Lahir",
              hintText: "Isi tempat sesuai KTP",
              hintStyle: TextStyle(color:Colors.grey[400]),
              //errorText: "Ketik nama anda",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              cred.value.pob = value;
            },
            style: TextStyle(color:Colors.grey[900], fontSize: 14),
            onSaved: (value){
              cred.value.pob = value!;
            },
            validator: (value){
              if(value!.isEmpty){
                return "Isi tempat lahir";
              } else {
                return null;
              }
            },
          ), //tempat lahir

          SizedBox(height: 15),

          ValueListenableBuilder<DateTime?>(
              valueListenable: dateSub,
              builder: (context, dateVal, child) {
                return InkWell(
                  onTap: () async {
                    DateTime? _date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime.now(),
                        currentDate: DateTime.now(),
                        initialEntryMode: DatePickerEntryMode.calendar,
                        initialDatePickerMode: DatePickerMode.day,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.fromSwatch(
                                  primarySwatch: Colors.blueGrey,
                                  accentColor: kPrimaryColor,
                                  backgroundColor: Colors.lightBlue,
                                  cardColor: Colors.white,
                                )
                            ),
                            child: child!,
                          );
                        });
                    dateSub.value = _date;
                    dateVal = _date;
                  },
                  child: SizedBox(
                    width: _width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        DOB(
                            dateVal != null ? convertDate(dateVal!) : ''
                        ),

                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Icon(Icons.calendar_today_rounded, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

          SizedBox(height: 15),

          TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(text: cred.value.phoneNumber, selection: TextSelection.collapsed(offset: cred.value.phoneNumber.length))),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(color: Colors.red),
                gapPadding: 10,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                child: FaIcon(FontAwesomeIcons.mobile, size: 20),
              ),
              labelText: "Nomor Handphone",
              hintText: "Isi nomor HP aktif",
              hintStyle: TextStyle(color:Colors.grey[400]),
              //errorText: "Ketik nama anda",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              cred.value.phoneNumber = value;
            },
            style: TextStyle(color:Colors.grey[900], fontSize: 14),
            onSaved: (value){
              cred.value.phoneNumber = value!;
            },
            validator: (value){
              if(value!.isEmpty){
                return "Isi nomor HP aktif";
              } else {
                return null;
              }
            },
          ), //no.hp

          SizedBox(height: 15),

          TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(text: cred.value.motherName, selection: TextSelection.collapsed(offset: cred.value.motherName.length))),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(color: Colors.red),
                gapPadding: 10,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                child: FaIcon(FontAwesomeIcons.user, size: 20),
              ),
              labelText: "Nama Ibu Kandung",
              hintText: "Isi nama ibu sesuai KK",
              hintStyle: TextStyle(color:Colors.grey[400]),
              //errorText: "Ketik nama anda",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              cred.value.motherName = value;
            },
            style: TextStyle(color:Colors.grey[900], fontSize: 14),
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
          ), //nama ibu kandung

          SizedBox(height: 15),

          Container(
            width: _width,
            height: 65,
            padding: EdgeInsets.only(left: 10, right: 20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: kTextColor),
              borderRadius: BorderRadius.circular(35),
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
                  child: Text('Pendidikan Terakhir', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
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
                    } else if(newValue == 'S3'){
                      cred.value.status = 'S3';
                    } else {
                      cred.value.status = 'Null';
                    }
                    newValue;
                    print(newValue);
                  });
                },
                value: newValue,
                validator: (value) => value!.isEmpty ? 'Pilih edukasi terakhir' : null,
                items: education.map((String value) {
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
          ), //pendidikan terakhir

          SizedBox(height: 15),

          Container(
            width: _width,
            height: 65,
            padding: EdgeInsets.only(left: 10, right: 20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: kTextColor),
              borderRadius: BorderRadius.circular(35),
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
                  child: Text('Pekerjaan', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                ),
                onChanged: (changedValue) {
                  newValue = changedValue!;
                  setState(() {
                    if(Value == 'Bidan'){
                      cred.value.roles = 'Bidan';
                    } else if(Value == 'Buruh'){
                      cred.value.roles = 'Buruh';
                    } else if(Value == 'Dokter'){
                      cred.value.roles = 'Dokter';
                    } else if(Value == 'Guru'){
                      cred.value.roles = 'Guru';
                    } else if(Value == 'Karyawan'){
                      cred.value.roles = 'Karyawan';
                    } else if(Value == 'Kepala Sekolah'){
                      cred.value.roles = 'Kepala Sekolah';
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
                    } else if(Value == 'Tukang'){
                      cred.value.roles = 'Tukang';
                    } else if(Value == 'Wirausaha'){
                      cred.value.roles = 'Wirausaha';
                    } else {
                      cred.value.roles = 'Lainnya';
                    }
                      Value;
                    print(Value);
                  });
                },
                value: Value,
                validator: (value) => value!.isEmpty ? 'Pilih pekerjaan' : null,
                items: jobs.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      width: _width,
                      padding: EdgeInsets.only(left: 10),
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
          ), //pekerjaan

          SizedBox(height: 15),

          TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(text: cred.value.bank, selection: TextSelection.collapsed(offset: cred.value.bank.length))),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                borderSide: BorderSide(color: Colors.red),
                gapPadding: 10,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                child: FaIcon(FontAwesomeIcons.wallet, size: 20),
              ),
              labelText: "Pendapatan",
              hintText: "Isi pendapatan per bulan",
              hintStyle: TextStyle(color:Colors.grey[400]),
              //errorText: "Ketik nama anda",
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              cred.value.bank = value;
            },
            style: TextStyle(color:Colors.grey[900], fontSize: 14),
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
          ), //pendapatan

          SizedBox(height: 15),

          ValueListenableBuilder<DateTime?>(
              valueListenable: dateSub,
              builder: (context, dateVal, child) {
                return InkWell(
                  onTap: () async {
                    DateTime? _date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                        currentDate: DateTime.now(),
                        initialEntryMode: DatePickerEntryMode.calendar,
                        initialDatePickerMode: DatePickerMode.day,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.fromSwatch(
                                  primarySwatch: Colors.blueGrey,
                                  accentColor: kPrimaryColor,
                                  backgroundColor: Colors.lightBlue,
                                  cardColor: Colors.white,
                                )
                            ),
                            child: child!,
                          );
                        });
                    dateSub.value = _date;
                    dateVal = _date;
                  },
                  child: SizedBox(
                    width: _width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        buildDateTimePicker(
                            dateVal != null ? convertDate(dateVal!) : ''
                        ),

                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Icon(Icons.calendar_today_rounded, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }), //tanggal penyelesaian bangunan

          SizedBox(height: 30),

          DefaultButton(
              text: 'Submit',
              press: (){
                Get.offAllNamed('/home');
              }
          ),
        ],
      ),
    );
  }



  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  Widget buildDateTimePicker(String data) {

    UserDashboardController _userController = Get.find();
    var cred = _userController.credential;
    TextEditingController date = TextEditingController.fromValue(
        TextEditingValue(text: cred.value.status, selection: TextSelection.collapsed(offset: cred.value.status.length))
    );

    date.text = '${data}';

    double _width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: _width*0.7,
      height: 60,
      child: TextFormField(
        controller: date,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 10,
          ),
          labelText: "Tanggal Penyelesaian Bangunan",
          hintText: "Isi tanggal rencana penyelesaian bangunan",
          hintStyle: TextStyle(color:Colors.grey[400]),
          border: const OutlineInputBorder(),
        ),
        onChanged: (value) {
          data = value;
          cred.value.status;
        },
        style: TextStyle(color:Colors.grey[900], fontSize: 14),
        onSaved: (value){
          data = value!;
          cred.value.status;
        },
        validator: (value){
          if(value!.isEmpty){
            return "Pilih tanggal disamping";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget DOB(String data){

    UserDashboardController _userController = Get.find();
    var cred = _userController.credential;
    TextEditingController date = TextEditingController.fromValue(
        TextEditingValue(text: cred.value.dob, selection: TextSelection.collapsed(offset: cred.value.dob.length))
    );

    date.text = '${data}';

    double _width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: _width*0.7,
      height: 60,
      child: TextFormField(
        controller: date,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            borderSide: BorderSide(color: Colors.red),
            gapPadding: 10,
          ),
          labelText: "Tanggal Lahir",
          hintText: "Isi tanggal lahir",
          hintStyle: TextStyle(color:Colors.grey[400]),
          border: const OutlineInputBorder(),
        ),
        onChanged: (value) {
          data = value;
          cred.value.status;
        },
        style: TextStyle(color:Colors.grey[900], fontSize: 14),
        onSaved: (value){
          data = value!;
          cred.value.status;
        },
        validator: (value){
          if(value!.isEmpty){
            return "Pilih tanggal disamping";
          } else {
            return null;
          }
        },
      ),
    );
  }

}
