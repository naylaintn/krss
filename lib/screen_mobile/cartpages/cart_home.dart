import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../bloc/cart_controller.dart';
import '../../util/global_widget.dart';
import '../../util/style.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    CartController controller = Get.put(CartController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor)),
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Column(
                children: [
                  CartTemplate(
                    title: 'Semen',
                    price: 40000,
                    remove: (){
                      controller.decrement();
                    },
                    add: (){
                      controller.increment();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        bottomNavigationBar: Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                ),
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Rp. Total Ammount", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kTextColor)),
              DefaultButton(
                text: 'Bayar',
                press: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartTemplate extends StatelessWidget {
  String title;
  int price=0;
  final VoidCallback add;
  final VoidCallback remove;
  CartTemplate({
    Key? key,
    required this.title,
    required this.remove,
    required this.add,
    this.price=0,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    CartController controller = Get.put(CartController());
    final currencyFormatter = NumberFormat('#,##0', 'ID');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: 120,
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: height,
                decoration: BoxDecoration(
                  color: kSecondaryLightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, textAlign: TextAlign.left, style: Theme.of(context).textTheme.labelMedium),
                    Text('Rp ${currencyFormatter.format(price)}', style: Theme.of(context).textTheme.labelMedium),
                    Row(
                      children: [
                        IconButton(
                          onPressed: remove,
                          splashRadius: 10,
                          icon: const Icon(Icons.remove_circle, color: kTextColor, size: 20),
                        ),

                        Obx((){
                          return Text(controller.product.toString(), style: Theme.of(context).textTheme.labelSmall);
                        }),

                        IconButton(
                          onPressed: add,
                          splashRadius: 10,
                          icon: const Icon(Icons.add_circle, color: kTextColor, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){},
                    splashRadius: 10,
                    icon: const Icon(Icons.delete, color: Colors.redAccent, size: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}