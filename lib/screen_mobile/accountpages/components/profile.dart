import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krss/bloc/login_controller.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krss/bloc/user_controller.dart';
import 'package:krss/model/user_data.dart';
import 'package:krss/util/global_widget.dart';

import '../../../util/style.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    UserModel userModel = UserModel();
    UserDashboardController controller = Get.find();
    LoginController authController = Get.find();

    TextEditingController name = TextEditingController.fromValue(TextEditingValue(text: userModel.name, selection: TextSelection.collapsed(offset: userModel.name.length)));
    TextEditingController email = TextEditingController.fromValue(TextEditingValue(text: authController.check.value.userId, selection: TextSelection.collapsed(offset: authController.check.value.userId.length)));
    TextEditingController phoneNumber = TextEditingController.fromValue(TextEditingValue(text: userModel.alias, selection: TextSelection.collapsed(offset: userModel.alias.length)));


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          title: Text("Edit Profile", style: TextStyle(color: kTextColor)),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 10,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                          child: FaIcon(FontAwesomeIcons.user, size: 20),
                        ),
                        labelText: "Nama Lengkap",
                        hintText: "Masukkan nama lengkap",
                        hintStyle: TextStyle(color:Colors.grey[400]),
                        //errorText: "Ketik nama anda",
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        userModel.name = value;
                      },
                      style: TextStyle(color:Colors.grey[900], fontSize: 14),
                      onSaved: (value){
                        userModel.name = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Isi nomor HP aktif";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 10,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                          child: FaIcon(FontAwesomeIcons.at, size: 20),
                        ),
                        labelText: "Email",
                        hintText: "Masukkan email yang terdaftar",
                        hintStyle: TextStyle(color:Colors.grey[400]),
                        //errorText: "Ketik nama anda",
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        authController.check.value.userId = value;
                      },
                      style: TextStyle(color:Colors.grey[900], fontSize: 14),
                      onSaved: (value){
                        authController.check.value.userId = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Isi email";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: kTextColor),
                          gapPadding: 10,
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.red),
                          gapPadding: 10,
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                          child: FaIcon(FontAwesomeIcons.mobile, size: 20),
                        ),
                        labelText: "Nomor HP",
                        hintText: "Masukkan nomor HP aktif",
                        hintStyle: TextStyle(color:Colors.grey[400]),
                        //errorText: "Ketik nama anda",
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        userModel.alias = value;
                      },
                      style: TextStyle(color:Colors.grey[900], fontSize: 14),
                      onSaved: (value){
                        userModel.alias = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Isi nomor HP aktif";
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(height: 30),

                    DefaultButton(
                      text: 'Simpan',
                      press: (){
                        if(_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          userModel.imei = "NA";
                          userModel.enabled = true;
                          userModel.accountNonExpired = false;
                          userModel.dob="01-01-01";
                          userModel.pob="ID";
                          userModel.chain="NA";
                          userModel.classification='KRSS_USER';
                          userModel.expired=false;
                          userModel.locked=false;
                          userModel.partner='KRSS';
                          userModel.status="SYSTEM_BACKEND";
                          userModel.trial=0;
                          userModel.type="SYSTEM_USER";
                          userModel.userId=authController.check.value.userId;
                          userModel.roles=authController.check.value.userData.roles;
                          userModel.userTypes = authController.check.value.userId;

                          controller.userModel = userModel;

                          controller.submitProfile(controller.userModel, authController.check.value.token, authController.check.value.userId);

                          Get.snackbar(
                            "Sukses",
                            'Profil berhasil disimpan',
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
            ),
          ],
        ),
      ),
    );
  }
}
