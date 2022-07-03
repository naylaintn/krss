import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:krss/bloc/login_controller.dart';
import 'package:krss/model/credential.dart';
import 'package:http/http.dart' as http;
import 'package:krss/model/user_data.dart';
import '../model/response.dart';
import '../util/constants.dart' as constants;

class ProfileController extends GetxController {

  final _phDomain = constants.domain;

  UserModel profile = UserModel();

  void submitProfile() async {

    String json = jsonEncode(profile);

    //print(json);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'userId': profile.userId,
      'roles': profile.roles,
    };

    var uri = Uri.https(_phDomain, "/powerhost/registration/user");

    try{


      print("save cred");
      http.Response response = await http.post(uri, headers: headers, body: json);
      print(response.body);

      if(response.statusCode == 200){
        profile = UserModel.fromJson(jsonDecode(response.body));
      } else {
        print("save fail with host response : ${response.statusCode}");
      }

    } catch(e){
      print("save profile error : ${e.toString()}");
    }

  }

}