import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:krss/bloc/login_controller.dart';
import 'package:krss/model/credential.dart';
import '../util/constants.dart' as constant;
import 'package:http/http.dart' as http;

class UserDashboardController extends GetxController{

  final String _phDomain = constant.domain;

  LoginController controller = Get.find();
  Credential cred = Credential();
  var credential = Credential().obs;


  void submitCredRegistration() async {

    String json = jsonEncode(cred);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': controller.check.value.token,
      'userid': controller.check.value.userId
    };

    var uri = Uri.https(_phDomain, "/powerhost/credential/save");


    try{

      http.Response response = await http.post(uri, headers: headers, body: json);

      if(response.statusCode == 200){
        getCredential(controller.check.value.userId, controller.check.value.token);
      } else {
        print("save fail with host response : ${response.statusCode}");
      }
    } catch (e){
      print("credential error : ${e.toString()}");
    }
  }

  void getCredential(String userId, String token) async{

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': token,
      'userid': userId
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