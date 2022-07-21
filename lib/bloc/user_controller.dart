import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krss/bloc/login_controller.dart';
import 'package:krss/model/credential.dart';
import '../model/page_user.dart';
import '../model/user_data.dart';
import '../util/constants.dart' as constant;
import 'package:http/http.dart' as http;

class UserDashboardController extends GetxController{

  final String _phDomain = constant.domain;

  LoginController loginController = Get.find();
  Credential cred = Credential();
  var credential = Credential().obs;
  var pageUser = PageUser(content: []).obs;
  UserModel userModel = UserModel();

  void submitProfile(UserModel cred, String token, String userid) async {

    String json = jsonEncode(cred);

    print(json);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': loginController.check.value.token,
      'userid': loginController.check.value.userId
    };

    var uri = Uri.https(_phDomain, "/powerhost/registration/user");

    try{


      print("save cred");
      http.Response response = await http.post(uri, headers: headers, body: json);
      print(response.body);

      if(response.statusCode == 200){
        if (response.body=="00"){
          getUser(loginController.check.value.userId, 0, 20);
        } else {
          Get.snackbar(
            "Gagal",
            'Profile gagal disimpan',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            instantInit: false,
          );
        }
      } else {
        print("save fail with host response : ${response.statusCode}");
      }

    } catch(e){
      print("save profile error : ${e.toString()}");
    }

  }


  void submitCredRegistration() async {

    String json = jsonEncode(cred);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': loginController.check.value.token,
      'userid': loginController.check.value.userId
    };

    var uri = Uri.https(_phDomain, "/powerhost/credential/save");


    try{

      http.Response response = await http.post(uri, headers: headers, body: json);

      if(response.statusCode == 200){
        getUser('userid', 0, 20);
      } else {
        print("save fail with host response : ${response.statusCode}");
      }
    } catch (e){
      print("credential error : ${e.toString()}");
    }
  }

  void getUser(String userType, int page, int size) async {

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': loginController.check.value.token,
      'userid': loginController.check.value.userId
    };

    Map<String, String> params = {
      'usertypes': userType,
      'page': page.toString(),
      'size': size.toString(),
    };


    var uri = Uri.https(_phDomain, "/powerhost/registration/page/usertypes", params);

    try {

      http.Response response = await http.get(uri, headers: headers);
      print(response.body);

      if (response.statusCode == 200) {

        pageUser.value = PageUser.fromJson(jsonDecode(response.body));

      } else {

      }

    } catch(e){

    }


  }

  void getCredential(String userId, String token) async{

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': loginController.check.value.token,
      'userid': loginController.check.value.userId
    };

    var uri = Uri.https(_phDomain, "/powerhost/credential/credential");

    try{

      http.Response response = await http.get(uri, headers: headers);

      if(response.statusCode == 200){
        cred = Credential.fromJson(jsonDecode(response.body));
      } else {
        print("save fail with host response : ${response.statusCode}");
      }

    } catch(e){

    }
  }

}