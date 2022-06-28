
import 'dart:convert';
import 'dart:io';

import 'package:krss/model/RAB.dart';
import 'package:krss/model/credential.dart';
import 'package:get/get.dart';
import '../model/response.dart';
import '../util/constants.dart' as constants;
import 'package:http/http.dart' as http;

class RABController extends GetxController{

  final _ph = constants.ph;
  final ph_domain = constants.domain;

  var User = Credential().obs;
  var rabList = <RABModel>[].obs;

  RABModel RAB = RABModel();

  String token = '';
  String userid = '';


  void saveRAB() async {

    String json = jsonEncode(RAB);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': token,
      'userid': userid
    };

    var url = Uri.https(ph_domain, "/powerhost/course");

    try{

      http.Response response = await http.post(url, body: json, headers: headers);

      print('submit rab : status ${response.statusCode} : ${response.body}');

      if(response.statusCode==200){
        HostResponse hostResponse = HostResponse.fromJson(jsonDecode(response.body));
        if(hostResponse.responseCode == '00'){
          RAB = RABModel.fromJson(hostResponse.content);
          getRABList(RAB.parentId);
        } else {
          print("Save RAB error" + "${hostResponse.responseCode}" + "${hostResponse.responseMessage}");
        }
      } else {
        print("save fail with host response : ${response.statusCode}");
      }

    } catch(e){
      print("saveRAB error : ${e.toString()}");
      Get.snackbar("Gagal menyimpan", "Coba ulang lagi", snackPosition: SnackPosition.TOP, instantInit: false);
    }

  }

  void getRABList(int parentId) async {

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': token,
      'userid': userid
    };

    Map<String, String> params = {
      'parentId': parentId.toString(),
    };

    var uri = Uri.https(ph_domain, "/powerhost/course", params);

    try {

      http.Response response = await http.get(uri, headers: headers);

      if(response.statusCode == 200){

        HostResponse hostResponse = HostResponse.fromJson(jsonDecode(response.body));

        if(hostResponse.responseCode == '00'){
          List list = hostResponse.content;
          rabList.value = list.map((e) => RABModel.fromJson(e)).toList();
          print("getRABList success");
        } else {
          print("getRABList fail with service response : ${hostResponse.responseCode}");
        }
      } else {
        print("getRABList fail with host response : ${response.statusCode}");
      }

    } catch(e){
      print("getRAB error : ${e.toString()}");
    }

  }


  void deleteRAB(int id, int parentId) async {

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': token,
      'userid': userid
    };

    Map<String, String> params = {
      'id': id.toString(),
    };

    var uri = Uri.https(ph_domain, "/powerhost/course", params);

    try {

      http.Response response = await http.delete(uri, headers: headers);
      if(response.statusCode == 200){
        HostResponse hostResponse = HostResponse.fromJson(jsonDecode(response.body));
        if(hostResponse.responseCode == '00'){
          getRABList(parentId);
        }
      } else {

      }

    } catch(e){
      print("delete rab list error : ${e.toString()}");
    }

  }




}