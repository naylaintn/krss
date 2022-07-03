import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:crop_your_image/crop_your_image.dart';

import '../../../bloc/avatar_controller.dart';
import '../../../bloc/login_controller.dart';
import '../../../util/style.dart';

class AvatarChange extends StatelessWidget {
  const AvatarChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController _loginController = Get.find();
    AvatarController _avatarController = Get.put(AvatarController());

    final _cropController = CropController();


    Uint8List? _croppedImageData;
    Uint8List? _pickedImageData;

    double _x = 0.0;
    double _y = 0.0;
    double _tlX = 0.0;
    double _tlY = 0.0;
    double _w = 0.0;
    double _h = 0.0;


    void getImageFile() async {


      _avatarController.loading.value = RxBool(true);
      _avatarController.hasBeenCropped.value = RxBool(false);

      final result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);

      if(result==null){
        return;
      }

      if (result.isSinglePick){
        _pickedImageData = result.files.first.bytes;
        _avatarController.croppedImageStateChange(1);

      }

    }


    String base64Img="";

    void assignPreview2Canvass(){

      base64Img =  base64Encode(_croppedImageData!.toList());
      if (base64Img.startsWith("iV")){
        base64Img = "data:image/png;base64," + base64Img;
      } else {
        base64Img = "data:image/jpg;base64," + base64Img;
      }

      //imageCanvas(base64Img);

    }

    void compressAndSave(){

      String base64Compress = base64Img;

      //String base64Compress = imageCompress();

      _avatarController.saveUserAvatar(base64Compress, "useravatar_${_loginController.check.value.userId}", _loginController.check.value.userId, _loginController.check.value.token);

      _loginController.imageData.value.content = base64Compress;

      var imageArray = base64Compress.split(",");
      _loginController.imageData.value.content = imageArray[1];
      _loginController.imageData.value.img = base64Decode(_loginController.imageData.value.content);
      _loginController.imageData.value.available = true;

      _avatarController.croppedImageState.value = 2;


    }


    void _onHover(PointerEvent details){
      _x = details.localPosition.dx;
      _y = details.localPosition.dy;

      //print("position X : $_x, $_tlX ${_tlX + _w}");
      //print("position Y : $_y, $_tlY ${_tlY + _h}");

      if(_x>_tlX && _x<(_tlX+_w) && _y>_tlY && _y<(_tlY+_h)){
        _avatarController.cursorState.value = 1;
      } else {
        _avatarController.cursorState.value = 0;
      }

      //print("cursor state : ${_avatarController.cursorState.value}");

    }

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        width: _width,
        height: _height,
        child: Center(
          child: GetX<AvatarController>(
            builder: (controller){
              int cropState = controller.croppedImageState.value;

              if(controller.hasBeenCropped.value.isTrue){
                assignPreview2Canvass();
              }
              if(cropState==0){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    controller.imageData.value.available==true ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.memory(controller.imageData.value.img),
                      ),
                    ): CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Center(
                          child: FaIcon(FontAwesomeIcons.solidCircleUser, color: kPrimaryColor, size: 90)),
                    ),

                    const SizedBox(height: 24, width: 0,),

                    controller.loading.value.isTrue
                        ? Container(
                          width: _width*0.3,
                          height: _height*0.1,
                            child: ClipRRect(
                              child: Image.asset("assets/images/loading.gif", fit: BoxFit.fitWidth),
                            ),
                        )
                        :const Text(""),

                    const SizedBox(height: 100, width: 0,),

                    InkWell(
                      onTap: (){getImageFile();},
                      child: Container(
                        width: 150,
                        height: 50,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(35)
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.image, color: Colors.white),
                              SizedBox(width: 10),
                              Text('Change', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );

              } else if(cropState==1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Stack(
                      children: [
                        Visibility(
                          visible: controller.preview.value==1?false:true,
                          child: MouseRegion(
                            onHover: _onHover,
                            cursor: controller.cursorState.value==0?SystemMouseCursors.basic:SystemMouseCursors.move,
                            child: SizedBox(
                              width: 0.5*_width,
                              height: 0.5*_width,
                              child: Crop(
                                  onCropped: (Uint8List value) {
                                    _croppedImageData = value;
                                    controller.hasBeenCropped.value=RxBool(true);
                                  },
                                  image: _pickedImageData!,
                                  controller: _cropController,
                                  initialSize: 0.7,
                                  aspectRatio: 1,
                                  withCircleUi: false,
                                  cornerDotBuilder: (size, edgeAlignment) =>
                                  const MouseRegion(
                                      cursor: SystemMouseCursors.grabbing,
                                      child: DotControl(color: Colors.blue)),
                                  baseColor: const Color.fromARGB(0, 255, 255, 255),
                                  maskColor: Colors.black.withAlpha(99),
                                  onMoved: (newRect) {
                                    // do something with current cropping area.
                                    //print("status : ${newRect.toString()}");

                                    _tlX = newRect.topLeft.dx;
                                    _tlY = newRect.topLeft.dy;
                                    _w = newRect.width;
                                    _h = newRect.height;


                                    //print("status : $_tlX $_tlY $_w $_h");
                                    controller.hasBeenCropped.value=RxBool(false);


                                  },
                                  onStatusChanged: (status) {
                                    //print("status : ${status.name}");
                                    // do something with current CropStatus
                                    if(status == CropStatus.ready){
                                      controller.loading.value = RxBool(false);
                                    } else if(status == CropStatus.loading){
                                      controller.loading.value = RxBool(true);
                                      controller.hasBeenCropped.value=RxBool(false);
                                    }

                                  }

                              ),
                            ),
                          ),
                        ),

                        controller.preview.value==1?Center(
                          child: Container(
                            width: 0.5*_width,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.hasBeenCropped.value.isTrue ? Image.memory(_croppedImageData!) : SizedBox(width: 150, height: 150,),
                                const SizedBox(height: 8, width: 0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        controller.preview.value=0;
                                        controller.hasBeenCropped.value=RxBool(false);
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.circular(35)
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.preview, color: Colors.white),
                                              SizedBox(width: 10),
                                              Text('Back'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: (){
                                        controller.preview.value=0;
                                        controller.hasBeenCropped.value=RxBool(false);
                                        compressAndSave();
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.circular(35)
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.preview, color: Colors.white),
                                              SizedBox(width: 10),
                                              Text('Save'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ) : const SizedBox(width: 0, height: 0,),
                      ],
                    ),

                    Visibility(
                      visible: controller.preview.value==1 ? false : true,
                      child: Container(
                        width: 0.5*_width,
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const SizedBox(height: 24, width: 0,),

                            InkWell(
                              onTap: (){
                                controller.hasBeenCropped.value=RxBool(false);
                                _cropController.crop();
                                controller.preview.value=1;
                              },
                              child: Container(
                                width: 150,
                                height: 50,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(35)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.preview, color: Colors.white),
                                    SizedBox(width: 10),
                                    Text('Preview'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );

              } else {
                return Center(
                  child: Column(
                    children: [
                      Image.memory(_croppedImageData!),

                      const SizedBox(height: 24, width: 0,),

                      GetX<AvatarController>(
                          builder: (_controller){

                            if(_controller.imageData.value.available){

                              return Text("Picture Saved".tr);
                            } else {

                              return Text("Upload Picture".tr);
                            }
                          }),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
