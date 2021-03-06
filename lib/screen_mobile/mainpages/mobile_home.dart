import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krss/bloc/login_controller.dart';
import 'package:krss/bloc/rab_controller.dart';
import 'package:krss/util/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mobile_Dashboard extends StatelessWidget {
  const Mobile_Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LoginController _controller = Get.find();

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        iconTheme: IconThemeData(
            color: kPrimaryColor
        ),
        backgroundColor: Colors.white,
        title: Container(
          width: _width*0.3,
          child: ClipRRect(
            child: Image.asset("assets/images/logo.png", fit: BoxFit.fitHeight),
          ),
        ),

        actions: [
          IconButton(
            splashRadius: 10,
            splashColor: Colors.transparent,
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.solidBell, size: 15, color: kPrimaryColor),
          ),
          IconButton(
            splashRadius: 10,
            splashColor: Colors.transparent,
            onPressed: (){},
            icon: FaIcon(FontAwesomeIcons.cartShopping, size: 15, color: kPrimaryColor),
          ),
          GetX<LoginController>(
            builder: (controller){
              if(controller.login.value.isTrue){
                return Obx((){
                  if(controller.imageData.value.available==true){
                    return InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(right: 20, left: 15),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                        ),
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.memory(controller.imageData.value.img),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: IconButton(
                        splashRadius: 10,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.solidCircleUser, size: 18, color: kPrimaryColor),
                      ),
                    );
                  }
                });
              } else {
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                    splashRadius: 10,
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.solidCircleUser, size: 18, color: kPrimaryColor),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Container(
        height: _height < 700 ? _height*1.5 : _height,
        child: ListView(
          children: [
            SizedBox(height: 10),
            Header(),
            InformasiKPR(),
            Obx((){
              if(_controller.login.value.isTrue){
                return Column(
                  children: [
                    WidgetOption(),
                    Menu(),
                  ],
                );
              } else {
                return Menu();
              }
            }),
            Container(
                height: _height < 800
                    ? _height*0.1
                    : _height < 700
                    ? _height*0.2
                    : _height*0.03
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    LoginController _controller = Get.find();

    return Container(
      width: _width,
      height: _height < 650
          ? _height*0.38
          : _height < 800
          ? _height*0.27
          : _height*0.2,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: _width < 400 ? 10 : 20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.3),
            blurRadius: 50,
            offset: const Offset(10, 20),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetX<LoginController>(
            builder: (controller){
              if(controller.login.value.isTrue){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx((){
                      if(controller.User.value.name==true){
                        return Text(controller.User.value.name,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
                      } else {
                        return Text("User", textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
                      }
                    }),

                    SizedBox(height: 20),


                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Provinsi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            Obx((){
                              if(controller.User.value.addressL1==true){
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text(controller.User.value.addressL1, style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              } else {
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              }
                            }),
                          ],
                        ),

                        SizedBox(height: 5),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Kota/Kabupaten", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            Obx((){
                              if(controller.User.value.addressL2==true){
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text(_controller.User.value.addressL2, style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              } else {
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              }
                            }),
                          ],
                        ),

                        SizedBox(height: 5),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Kecamatan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            Obx((){
                              if(controller.User.value.addressL3==true){
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text(_controller.User.value.addressL3, style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              } else {
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              }
                            }),
                          ],
                        ),

                        SizedBox(height: 5),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Desa", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            Obx((){
                              if(controller.User.value.addressL4==true){
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text(_controller.User.value.addressL4, style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              } else {
                                return SizedBox(
                                  width: _width*0.4,
                                  child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                                );
                              }
                            }),
                          ],
                        ),
                      ],
                    ),
                  ],
                );


              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User", textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

                    SizedBox(height: 20),

                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Provinsi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            SizedBox(
                              width: _width*0.4,
                              child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Kota/Kabupaten", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            SizedBox(
                              width: _width*0.4,
                              child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Kecamatan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            SizedBox(
                              width: _width*0.4,
                              child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _width*0.3,
                              child: Text("Desa", style: TextStyle(fontWeight: FontWeight.bold, fontSize: _height < 700 ? 10 : 12)),
                            ),
                            SizedBox(
                              width: _width*0.4,
                              child: Text("-", style: TextStyle(fontSize: _height < 700 ? 10 : 12)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------

class InformasiKPR extends StatelessWidget {
  const InformasiKPR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    RABController rabController = Get.find();

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height < 650
          ? _height*0.35
          : _height < 800
          ? _height*0.25
          : _height*0.18,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: _width < 400 ? 10 : 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
      child: GetX<LoginController>(
        builder: (controller){
          if(controller.login.value.isTrue){
            return Column(
              children: [
                Container(
                  width: _width,
                  height: _height < 650
                      ? _height*0.15
                      : _height < 800
                      ? _height*0.1
                      : _height*0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: kPrimaryColor)
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Rp. 50.000.000", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: kPrimaryColor, fontWeight: FontWeight.bold)),
                                Text("Saldo Pinjaman KPR", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("XX Bulan", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: kPrimaryColor, fontWeight: FontWeight.bold)),
                                Text("Sisa Tenor KPR", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: _width,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){Get.toNamed("/pengajuan_kredit");},
                          child: Container(
                            height: 70,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.solidCreditCard, size: 15, color: Colors.white),
                                SizedBox(width: 20),
                                Text("Pengajuan Kredit", style: TextStyle(fontSize: 12, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child:  InkWell(
                          onTap: (){
                            rabController.getRABList();
                            Get.toNamed("/rab");
                            },
                          child: Container(
                            height: 70,
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.solidRectangleList, size: 15, color: Colors.white),
                                SizedBox(width: 20),
                                Text("RAB", style: TextStyle(fontSize: 12, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );

          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Silahkan masuk terlebih dahulu untuk membuat RAB dan pengajuan kredit",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

//----------------------------------------------------------------------------

class WidgetOption extends StatelessWidget {
  const WidgetOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height < 650
          ? _height*0.25
          : _height < 800
          ? _height*0.18
          : _height*0.15,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: _width < 400 ? 10 : 20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: kPrimaryColor,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                height: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(2, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: FaIcon(FontAwesomeIcons.wallet, size: 20, color: kPrimaryColor),
                ),
              ),

              Text("Pembayaran", style: TextStyle(fontSize: 10, color: Colors.white)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                height: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(2, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: FaIcon(FontAwesomeIcons.receipt, size: 20, color: kPrimaryColor),
                ),
              ),

              Text("Transaksi", style: TextStyle(fontSize: 10, color: Colors.white)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                height: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(2, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: FaIcon(FontAwesomeIcons.solidCircleQuestion, size: 20, color: kPrimaryColor),
                ),
              ),

              Text("FAQ", style: TextStyle(fontSize: 10, color: Colors.white)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                height: _width < 400
                    ? _width*0.15
                    : _width*0.13,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(2, 7),
                    ),
                  ],
                ),
                child: Center(
                  child: FaIcon(FontAwesomeIcons.solidComments, size: 20, color: kPrimaryColor),
                ),
              ),

              Text("Pengaduan", style: TextStyle(fontSize: 10, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------------------

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  List<menuItem> item = [
    menuItem(
      title: "Informasi Kredit",
      img: "cogwheel.png",
      navigate: "/information_credit",
    ),
    menuItem(
      title: "Daftar Toko Bangunan",
      img: "online-support.png",
      navigate: "/daftar_toko",
    ),
    menuItem(
      title: "Tukang Bangunan",
      img: "idea.png",
      navigate: "/tukang",
    ),
    menuItem(
      title: "Beli Bahan Bangunan",
      img: "wheelbarrow.png",
      navigate: "/store_page",
    ),
    menuItem(
      title: "Panduan Konstruksi",
      img: "planning.png",
      navigate: "",
    ),
    menuItem(
      title: "Tenaga Fasilitator Lapangan",
      img: "engineer.png",
      navigate: "/tfl",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height*0.3,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: _width < 400 ? 10 : 20),
      child: Wrap(
        spacing: 50,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: item.map((e) => MenuTemplate(e)).toList(),
      ),
    );
  }
}

class menuItem{
  String img;
  String title;
  String navigate;

  menuItem({required this.img, required this.title, required this.navigate});
}

class MenuTemplate extends StatelessWidget {

  menuItem MenuItems;
  MenuTemplate(this.MenuItems);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){Get.toNamed("${MenuItems.navigate}");},
          child: Container(
            width: _width*0.18,
            height: _width*0.18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(5, 10),
                ),
              ],
            ),

            child: Center(
              child: Container(
                width: 40,
                height: 40,
                child: ClipRRect(
                  child: Image.asset("assets/images/${MenuItems.img}", fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 5),

        SizedBox(
          width: 60,
          child: Wrap(
            children: [
              Text(MenuItems.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 12)),
            ],
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}


