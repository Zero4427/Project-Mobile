import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/cart_controller.dart';
import '../controllers/cod_info_controller.dart';

class CODInfoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CODInfoController>(() => CODInfoController());
  }
}

class CartItemBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<CartController>(() => CartController());
  }
}
