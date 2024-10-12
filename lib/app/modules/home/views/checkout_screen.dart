import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart'; // Pastikan AppRoutes diimport

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya (keranjang)
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lampiran tanda lokasi, kartu, dan centang
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.location_on, color: Colors.green),
                Icon(Icons.credit_card, color: Colors.green),
                Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Billing Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Form untuk input informasi pengguna
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Provinsi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Kode Pos',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Negara',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Opsi pemilihan
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Pilih Opsi',
                border: OutlineInputBorder(),
              ),
              items: <String>[
                'Instan', 'Reguler', 'Cargo'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {},
            ),
            const SizedBox(height: 20),
            // Persetujuan
            Row(
              children: [
                Checkbox(
                  value: false, // Ganti dengan variabel untuk status centang
                  onChanged: (bool? value) {
                    // Ganti dengan logika untuk mengubah status centang
                  },
                ),
                const Text('Saya setuju dengan detail pengiriman')
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman pembayaran menggunakan Get.toNamed
                Get.toNamed(AppRoutes.payments); // Pastikan rute ini sudah terdaftar di routes.dart
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Lanjutkan ke Pembayaran',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
