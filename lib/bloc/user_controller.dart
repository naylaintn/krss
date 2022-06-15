import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:krss/model/credential.dart';
import '../util/constants.dart' as constant;
import 'package:http/http.dart' as http;

class UserDashboardController extends GetxController{

  final String _phDomain = constant.domain;


  var credential = Credential().obs;
  var userid = "".obs;
  var token = "".obs;
  var pageView = "DASHBOARD".obs;
  var merchType = 'Choose Type'.obs;


  void submitUserRegistration(Credential cred, String token, String userid) async {

    String json = jsonEncode(cred);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': token,
      'userid': userid
    };

    var uri = Uri.https(_phDomain, "/powerhost/registration/user");


    try{
      http.Response response = await http.post(uri, headers: headers, body: json);

      //print(response.body);

      if(response.statusCode == 200){
        if (response.body=="00"){
          pageView.value = "CREDENTIALUSER_SUCCESS";
        } else {
          pageView.value = "CREDENTIALUSER_FAIL";
        }
      } else {
        pageView.value = "CREDENTIALUSER_FAIL";
      }
    } catch (e){
      pageView.value = "CREDENTIALUSER_ERROR";
    }
  }

}