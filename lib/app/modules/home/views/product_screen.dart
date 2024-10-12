import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/home/controllers/cart_controller.dart'; // Impor CartController
import 'package:project/app/models/cart_item.dart'; // Impor CartItem model

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    
    String productName = arguments['productName'];
    String productImage = arguments['productImage'];
    String productPrice = arguments['productPrice'];
    String productDescription = arguments['productDescription'];

    // Ambil instance dari CartController
    CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Product',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  productImage,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  productName,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productPrice, // Menggunakan productPrice dari argumen
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text('1 item', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Logika untuk like
                        },
                      ),
                      const Text('10'), // Jumlah likes
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('5.0', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, color: Colors.yellow),
                  const Text('10 comments'), // Jumlah komentar
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(productDescription), // Menggunakan productDescription dari argumen
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Buat item keranjang dan tambahkan ke keranjang
                    final cartItem = CartItem(
                      productName: productName,
                      productImage: productImage,
                      productPrice: productPrice,
                      quantity: 1,
                    );
                    cartController.addToCart(cartItem);
                    Get.snackbar(
                      'Added to Cart',
                      '$productName has been added to your cart',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                  ),
                  child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
