import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart'; // Ganti dengan path routes Anda

class PreviousOrderDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const PreviousOrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${order['orderNumber']}', style: const TextStyle(color: Colors.black)), // Menampilkan nama orderan
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Center(
              child: Image.asset(
                order['image'], // Path gambar produk
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Nama produk
            Text(
              order['productName'], // Nama produk
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Harga produk
            Text(
              'Price: \$${order['price']}', // Harga produk
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 8),
            // Waktu pembelian
            Text(
              'Order Date: ${order['date']}', // Tanggal dan jam
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Status order
            Text(
              'Status: ${order['status']}', // Status pesanan
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            // Tombol Help
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.faq); // Navigasi ke halaman FAQ
              },
              child: const Text('Help'),
            ),
            const SizedBox(height: 8),
            // Tombol Reorder
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.product, arguments: order); // Navigasi ke product_screen
              },
              child: const Text('Reorder'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Get.toNamed(AppRoutes.home); // Ganti dengan rute home Anda
              },
            ),
            IconButton(
              icon: const Icon(Icons.support),
              onPressed: () {
                Get.toNamed(AppRoutes.faq); // Ganti dengan rute FAQ Anda
              },
            ),
            IconButton(
              icon: const Icon(Icons.payment),
              onPressed: () {
                Get.toNamed(AppRoutes.payment); // Ganti dengan rute Payment Anda
              },
            ),
          ],
        ),
      ),
    );
  }
}
