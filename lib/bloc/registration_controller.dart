import 'package:get/get.dart';
import '../util/constants.dart' as constants;
import '../model/user_data.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../util/tools.dart';
import 'package:http/http.dart' as http;

import 'login_controller.dart';

class RegistrationController extends GetxController{

  final LoginController _loginController = Get.find();

  final _ph = constants.ph;
  Tools tools = Tools();

  var userData = UserModel(responseCode: "909").obs;
  var showButton1 = RxBool(true).obs;
  var showButton2 = RxBool(true).obs;
  var regState = 0.obs;

  var views = "MAIN_PAGE".obs;

  void getBack(){
    views.value = "MAIN_PAGE";
    _loginController.views.value = "MAIN_PAGE";
  }

  void registration(){
    views.value = "REGISTRATION_VIEW";
    _loginController.views.value = "MAIN_PAGE_OFF";
  }

  void login(){
    views.value = "REG_OFF";
    _loginController.views.value = 'LOGIN_VIEW';
  }

  void submitRegistration(UserModel userModel, String _passRef, String _password) async {

    if(_passRef != _password){
      userData.value.responseCode="39";
      userData.value.responseMessage="sandi tidak sama";
      return;
    }

    RegistrationModel regModel = RegistrationModel(
      userId: userModel.userId,
      roles: userModel.roles,
    );

    var passBytes = utf8.encode(_password);
    var passDigest = sha256.convert(passBytes);
    regModel.imei = tools.platformType();
    regModel.type = "SIMPLE_REG";
    regModel.pass = passDigest.toString();

    var url = Uri.parse(_ph + "/registration/simple/register");
    String json = jsonEncode(regModel);

    //print(json);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try{

      http.Response response = await http.post(url, body: json, headers: requestHeaders);

      //print('submit reg : status ${response.statusCode} : ${response.body}');

      if(response.statusCode==200){
        userData.value = UserModel.fromJson(jsonDecode(response.body));
        if(userData.value.responseCode=='00'){
          regState.value = 1;
          views.value = "REG_SUCCESS";
          _loginController.views.value = "MAIN_PAGE_OFF";
        } else {
          regState.value = 2;
          views.value = "REG_FAIL";
        }
      } else {
        regState.value = 3;
        userData.value.responseCode=response.statusCode.toString();
        userData.value.responseMessage= "maaf ada kesalahan";
        views.value = "REG_FAIL";
      }

    } catch(e){
      regState.value = 4;
      userData.value.responseCode="403";
      userData.value.responseMessage= "Error : " + e.toString();
      views.value = "REG_ERROR";
    }



  }

  void submitProfile() async {


  }


}