import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krss/main.dart';
import 'package:krss/root.dart';

import '../../../bloc/login_controller.dart';
import '../../../screen_desktop/mainpages/desktop_main_page.dart';
import '../../../screen_tablet/mainpages/tablet_main_page.dart';
import '../../../util/constants.dart';
import '../../../util/global_widget.dart';
import '../../../util/responsive.dart';
import '../../../util/style.dart';
import 'package:flutter_svg/svg.dart';

import '../../mainpages/mobile_home.dart';
import '../../mainpages/mobile_main_page.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  final LoginController _authController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(height: 30),
          buildPasswordFormField(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){},
                child: const Text(
                  "Lupa Password?",
                  style: TextStyle(decoration: TextDecoration.underline, fontSize: 15),
                ),
              ),
            ],
          ),
          FormError(errors),
          const SizedBox(height: 20),
          DefaultButton(
            text: "Masuk",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _authController.submitLogin(email, password, "ROLE_USER");

                Get.off(() => Mobile_MainPage());
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value.toString().isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.toString().length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
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
        labelText: "Password",
        hintText: "Masukkan Password",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon("assets/svg/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue as String,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value.toString().isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value.toString())) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
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

class FormError extends StatelessWidget {

  final List<String> errors;

  const FormError(this.errors, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width*0.3,
      child: Column(
        children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])),
      ),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/svg/Error.svg",
          height: 14,
          width: 14,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(error),
      ],
    );
  }
}