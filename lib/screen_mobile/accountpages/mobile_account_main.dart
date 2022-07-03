import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krss/bloc/login_controller.dart';
import 'package:krss/bloc/profile_controller.dart';
import 'package:krss/model/user_data.dart';
import 'package:krss/screen_mobile/accountpages/components/registrasi.dart';
import 'package:krss/util/global_widget.dart';
import 'package:krss/util/style.dart';

import 'components/login.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetX<LoginController>(
      builder: (controller){
        if(controller.login.value.isTrue){
          return AccountLoginTrue();
        } else {
          return AccountLoginFalse();
        }
      },
    );
  }
}

class AccountLoginTrue extends StatelessWidget {
  const AccountLoginTrue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LoginController controller = Get.find();

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: _width,
          height: _height,
          child: Column(
            children: [
              AccountHeader(),
              AccountBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountHeader extends StatelessWidget {
  const AccountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LoginController controller = Get.find();
    ProfileController profileController = Get.put(ProfileController());

    double _height = MediaQuery.of(context).size.height;

    return  Container(
      height: _height<800?_height*0.15:_height*0.1,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(5, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx((){
                if(controller.imageData.value.available==true){
                  return InkWell(
                    onTap: (){
                      Get.toNamed("/avatar");
                    },
                    child: CircleAvatar(
                      radius: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.memory(controller.imageData.value.img),
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: (){
                      Get.toNamed("/avatar");
                    },
                    child: Icon(Icons.account_circle, size: 35, color: kPrimaryColor),
                  );
                }
              }),

              SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profileController.profile.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor)),

                  SizedBox(height: 5),

                  Row(
                    children: [
                      Icon(Icons.email_rounded, size: 12, color: Colors.grey,),
                      SizedBox(width: 10),
                      Text(controller.check.value.userId, style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),

                  SizedBox(height: 5),

                  Row(
                    children: [
                      Icon(Icons.phone_android_rounded, size: 12, color: Colors.grey,),
                      SizedBox(width: 10),
                      Text(profileController.profile.alias, style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),

          InkWell(
            onTap: (){
              Get.toNamed('/edit_profile');
            },
            child: Icon(Icons.edit, color: kTextColor, size: 18),
          ),
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------------

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: _height<800?_height*0.3 : _height*0.2,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(5, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          InkWell(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.house, size: 16),
                    SizedBox(width: 10),
                    Text("Alamat Saya"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 12),
              ],
            ),
          ),

          InkWell(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.settings, size: 16),
                    SizedBox(width: 10),
                    Text("Pengaturan"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 12),
              ],
            ),
          ),

          InkWell(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.payment_rounded, size: 16),
                    SizedBox(width: 10),
                    Text("Transaksi"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 12),
              ],
            ),
          ),

          InkWell(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.logout, size: 16),
                    SizedBox(width: 10),
                    Text("Keluar"),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//-----------------------------------------------------------------------------

class AccountLoginFalse extends StatelessWidget {
  const AccountLoginFalse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: _width,
            height: _height,
            color: scaffoldColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Selamat datang!",
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Masukkan email dan password anda",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                SignForm(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun? ",
                      style: TextStyle(fontSize: 15),
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed("/registration");
                      },
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                            fontSize: 15,
                            color: kColor1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


