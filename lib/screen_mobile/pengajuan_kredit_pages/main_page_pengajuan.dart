import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krss/util/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../bloc/user_controller.dart';
import '../../util/theme.dart';

class CreditSubmission extends StatelessWidget {
  const CreditSubmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
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
                child: FaIcon(FontAwesomeIcons.user, size: 20),
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
          ),

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
          ),

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
          ),

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
          ),

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
          ),

          SizedBox(height: 15),

          ValueListenableBuilder<DateTime?>(
              valueListenable: dateSub,
              builder: (context, dateVal, child) {
                return InkWell(
                    onTap: () async {
                      DateTime? date = await showDatePicker(
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
                      dateSub.value = date;
                    },
                    child: buildDateTimePicker(
                        dateVal != null ? convertDate(dateVal) : 'Tanggal Penyelesaian Pembangunan Rumah'));
              }),

          SizedBox(height: 15),
        ],
      ),
    );
  }



  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  Widget buildDateTimePicker(String data) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: 65,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 15, top: 5, bottom: 5),
        textColor: kTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: const BorderSide(color: kTextColor),
        ),
        title: Text(data, style: TextStyle(color: data.isDateTime ? kTextColor : Colors.grey[600], fontSize: 14)),
        trailing: Icon(
          Icons.calendar_today,
          color: Colors.grey,
        ),
      ),
    );
  }

}
