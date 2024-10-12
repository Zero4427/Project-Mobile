import 'package:get/get.dart';
import 'package:project/app/models/cart_item.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(CartItem item) {
    // Cek jika produk sudah ada di keranjang
    final existingItem = cartItems.firstWhereOrNull((cartItem) => cartItem.productName == item.productName);
    if (existingItem != null) {
      existingItem.quantity += 1; // Tambah kuantitas jika sudah ada
    } else {
      cartItems.add(item); // Tambahkan item baru ke keranjang
    }
    update(); // Update UI jika ada perubahan
  }
}
