import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krss/screen_mobile/accountpages/mobile_account_main.dart';

import '../../../bloc/registration_controller.dart';
import '../../../util/constants.dart';
import '../../../util/global_widget.dart';
import '../../../util/style.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: _width,
            height: _height*0.8,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Registrasi",
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Daftar menggunakan email aktif anda",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                SignUpForm(),
                SizedBox(height: 30),
                Text(
                  'Dengan melanjutkan anda setuju dengan Term and Condition ini',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();


  String _pass1 = "";
  String _pass2 = "";
  bool _passOk = false;
  bool _unameOk = false;

  final RegistrationController _regController = Get.put(RegistrationController());


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(),

              const SizedBox(height: 30),

              Obx((){
                return TextFormField(
                  onChanged: (value){
                    _pass1 = value;
                  },
                  onSaved: (value){
                    _pass1 = value!;
                  },
                  validator: (value){
                    if(value!=null && value.isNotEmpty) {
                      if (value.length >= 8) {
                        _passOk = true;
                        return null;
                      } else if (value.length < 8) {
                        return kShortPassError;
                      } else {
                        _passOk = false;
                        return kPassNullError;
                      }
                    } else {
                      _passOk = false;
                      return kPassNullError;
                    }
                  },
                  keyboardType: TextInputType.text,
                  obscureText: _regController.showButton1.value.isTrue?true:false,

                  style: const TextStyle(fontSize: 15),
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
                    labelText: "Input Password",
                    hintText: "Masukkan password",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Obx((){
                      if (_regController.showButton1.value.isTrue){
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                          child: IconButton(
                            color: kPrimaryColor,
                            splashColor: Colors.transparent,
                            splashRadius: 1,
                            icon: const Icon(Icons.visibility,size: 20, color: Colors.grey),
                            onPressed: (){
                              _regController.showButton1.value = RxBool(false);
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            splashRadius: 1,
                            icon: const Icon(Icons.visibility,size: 20, color: kPrimaryColor),
                            onPressed: (){
                              _regController.showButton1.value = RxBool(true);
                            },
                          ),
                        );
                      }

                    }),
                  ),
                );
              }),

              const SizedBox(height: 30),

              Obx((){
                return TextFormField(
                  onChanged: (value){
                    _pass2 = value;
                  },
                  onSaved: (value){
                    _pass2 = value!;
                  },
                  validator: (value){
                    if(value!=null && value.isNotEmpty) {
                      if (value.length >= 8) {
                        _passOk = true;
                        return null;
                      } else if (value.length < 8) {
                        return kShortPassError;
                      } else {
                        _passOk = false;
                        return kPassNullError;
                      }
                    } else {
                      _passOk = false;
                      return kPassNullError;
                    }
                  },
                  keyboardType: TextInputType.text,
                  obscureText: _regController.showButton2.value.isTrue?true:false,
                  style: const TextStyle(fontSize: 15),
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
                    labelText: "Confirm Password",
                    hintText: "Masukkan password kembali",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Obx((){
                      if (_regController.showButton2.value.isTrue){
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            splashRadius: 1,
                            icon: const Icon(Icons.visibility,size: 20, color: Colors.grey),
                            onPressed: (){
                              _regController.showButton2.value = RxBool(false);
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            splashRadius: 1,
                            icon: const Icon(Icons.visibility,size: 20, color: kPrimaryColor),
                            onPressed: (){
                              _regController.showButton2.value = RxBool(true);
                            },
                          ),
                        );
                      }
                    }),
                  ),
                );
              }),
              const SizedBox(height: 30),
              DefaultButton(
                text: "Submit",
                press:  (){
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    _regController.userData.value.roles="ROLE_USER";
                    _regController.views.value="REG_ONGOING";
                    _regController.submitRegistration(_regController.userData.value, _pass1, _pass2);

                    Get.snackbar(
                      "Daftar Sukses",
                      'Silahkan cek email dan masuk setelah email diverfisikasi',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.white,
                      instantInit: false,
                      duration: Duration(milliseconds: 1500),
                    );

                    Get.off(AccountPage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value){
        _regController.userData.value.userId = value;
      },
      onSaved: (value){
        _regController.userData.value.userId = value!;
      },
      validator: (value){
        if(value!=null && value.isNotEmpty) {
          if (value.contains("@") && value.contains(".")) {
            _unameOk = true;
            return null;
          } else {
            _unameOk = false;
            return kInvalidEmailError;
          }
        } else {
          _unameOk = false;
          return kEmailNullError;
        }
      },
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(35)),
          borderSide: BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        labelText: "Email",
        hintText: "name@mailserver.com",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon("assets/svg/Mail.svg"),
      ),
    );
  }
}