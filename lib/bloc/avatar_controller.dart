import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../util/constants.dart' as constants;
import '../model/image_data.dart';

class AvatarController extends GetxController{

  final _ph = constants.ph;

  var itemIndexSelected = 0.obs;
  var imageData = ImageData().obs;
  var saveAvatarState = 0.obs;
  var croppedImageState = 0.obs;
  var rotation = 0.0.obs;
  var cursorState = 0.obs;
  var loading = RxBool(false).obs;
  var preview = 0.obs;
  var hasBeenCropped = RxBool(false).obs;

  void onItemSelected(int indexSelected){
    itemIndexSelected.value = indexSelected;
  }

  croppedImageStateChange(int cropState){
    croppedImageState.value = cropState;
  }

/*  void saveImage(String base64Image, String imageName, String userId, String token) async {

    var url = Uri.parse(_ph + "/img/save");

    ImageData imgData = ImageData(userId: userId, token: token, name: imageName, content: base64Image,);

    try{

      imageData.value.available=false;

      String json = jsonEncode(imgData);
      http.Response response = await http.post(url, body: json, headers: {HttpHeaders.contentTypeHeader: "application/json"});

      if (response.statusCode == 200) {
        imageData.value = ImageData.fromJson(jsonDecode(response.body));
        var imageArray = imageData.value.content.split(",");
        imageData.value.content = imageArray[1];
        imageData.value.img = base64Decode(imageData.value.content);
        saveAvatarState.value = 1;
        imageData.value.available=true;
      } else {
        imageData.value = ImageData(name:"NA", content: response.statusCode.toString() + " : " + response.body);
        saveAvatarState.value = 2;
      }

    } catch (e){
      imageData.value = ImageData(name:"NA", content: e.toString());
      saveAvatarState.value = 3;
    }

  }*/

  void saveUserAvatar(String base64Image, String imageName, String userId, String token) async{

    //print("will save picture");

    var url = Uri.parse(_ph + "/img/save");
    ImageData imgData = ImageData(userId: userId, token: token, name: "useravatar_$userId", content: base64Image,);

    try {

      imageData.value.available=false;

      String json = jsonEncode(imgData);
      http.Response response = await http.post(url, body: json, headers: {HttpHeaders.contentTypeHeader: "application/json"});
      //print(response.body);
      if (response.statusCode == 200) {
        imageData.value = ImageData.fromJson(jsonDecode(response.body));
        var imageArray = imageData.value.content.split(",");
        imageData.value.content = imageArray[1];
        imageData.value.img = base64Decode(imageData.value.content);
        imageData.value.available=true;
        //print("picture saved");
      } else {
        imageData.value = ImageData(name:"NA", content: response.statusCode.toString() + " : " + response.body);
        //print("${response.statusCode}");
      }

    } catch (e){
      imageData.value = ImageData(name:"NA", content: e.toString());
      //print(e.toString());
    }

  }

}

