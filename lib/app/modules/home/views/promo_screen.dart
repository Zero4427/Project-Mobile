import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart'; // Ganti dengan path routes Anda

class PromoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(AppRoutes.profile);
          },
        ),
        title: const Text('Promo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPromoCard('Gratis Ongkir', 'Minimal belanja: Rp50.000', 'Berlaku sampai: 31 Des 2024'),
          _buildPromoCard('Diskon 20%', 'Minimal belanja: Rp100.000', 'Berlaku sampai: 15 Nov 2024'),
          // Tambahkan lebih banyak kartu promo sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildPromoCard(String title, String minSpend, String expiryDate) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.local_offer), // Ikon diskon
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(minSpend),
                    Text(expiryDate),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk klaim promo
                    Get.snackbar('Promo Berhasil', 'Promo berhasil diklaim!', snackPosition: SnackPosition.BOTTOM);
                  },
                  child: const Text('Claim'),
                ),
                TextButton(
                  onPressed: () {
                    // Logika untuk menampilkan syarat dan ketentuan
                    Get.defaultDialog(
                      title: 'S&K',
                      content: const Text('Syarat dan ketentuan berlaku untuk mendapatkan promo ini.'),
                    );
                  },
                  child: const Text('S&K'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
