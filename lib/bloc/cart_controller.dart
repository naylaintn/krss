
import 'package:get/get.dart';

class CartController extends GetxController{

  var product = 0.obs;
  int get sum=>product.value;

  void increment(){
    product.value++;
  }

  void decrement(){
    product.value--;
  }

}