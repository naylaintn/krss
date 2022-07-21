
import 'dart:convert';
import 'dart:io';

import 'package:krss/bloc/login_controller.dart';
import 'package:krss/model/RAB.dart';
import 'package:get/get.dart';
import '../util/constants.dart' as constants;
import 'package:http/http.dart' as http;

class RABController extends GetxController{

  final ph_domain = constants.domain;

  LoginController loginController = Get.find();

  var rabList = <CostItem>[].obs;
  CostItem costItem = CostItem();

  var listArrived = RxBool(false).obs;

  String token = '';
  String userid = '';


  void saveRAB() async {

    String json = jsonEncode(costItem);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': loginController.check.value.token,
      'userid': loginController.check.value.userId,
    };

    var url = Uri.https(ph_domain, "/budget/costitem");

    try{

      http.Response response = await http.post(url, body: json, headers: headers);

      print('submit rab : status ${response.statusCode} : ${response.body}');

      if(response.statusCode==200){
        costItem = CostItem.fromJson(jsonDecode(response.body));
      } else {
        print("save fail with host response : ${response.statusCode}");
      }

    } catch(e){
      print("saveRAB error : ${e.toString()}");
      Get.snackbar("Gagal menyimpan", "Coba ulang lagi", snackPosition: SnackPosition.TOP, instantInit: false);
    }

  }

  void getRABList() async {

    listArrived.value = RxBool(false);

    Map<String, String> headers = {
      HttpHeaders.acceptHeader:"application/json",
      HttpHeaders.contentTypeHeader:"application/json",
      'token': loginController.check.value.token,
      'userid': loginController.check.value.userId,
    };


    var uri = Uri.https(ph_domain, "/budget/costitem/list");

    try {

      http.Response response = await http.get(uri, headers: headers);

      if(response.statusCode == 200){
        List list = jsonDecode(response.body);
        rabList.value = list.map((e) => CostItem.fromJson(e)).toList();
        listArrived.value = RxBool(true);
        print("getRABList success");

      } else {
        print("getRABList fail with host response : ${response.statusCode}");
      }

    } catch(e){
      print("getRAB error : ${e.toString()}");
    }

  }


  void deleteRAB(int id) async {

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
        costItem = CostItem.fromJson(jsonDecode(response.body));

      } else {

      }

    } catch(e){
      print("delete rab list error : ${e.toString()}");
    }

  }




}