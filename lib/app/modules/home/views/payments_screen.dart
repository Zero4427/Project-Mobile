import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart'; // Ganti dengan path routes Anda

class PaymentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text('Payment', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Image.asset('assets/visa.png', width: 40), // Gambar Visa
              title: Text('Credit Card **** **** **** 1234'), // Nomor Rekening
              subtitle: Text('Saldo: \$150.00'), // Saldo
              trailing: Icon(Icons.arrow_forward_ios), // Panah ke kanan
              onTap: () {
                // Logika untuk membuka metode pembayaran lainnya
              },
            ),
            Divider(),
            const Text(
              'Other Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.add, color: Colors.pink), // Ikon plus
              title: Text('Credit Card'),
              subtitle: Text('Dapatkan diskon 10%'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk memilih credit card
              },
            ),
            ListTile(
              leading: Image.asset('assets/credit.png', width: 40), // Ikon virtual account
              title: Text('Virtual Account Transfer'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk memilih virtual account
              },
            ),
            ListTile(
              leading: Image.asset('assets/dompet.png', width: 40), // Ikon e-wallet
              title: Text('E-Wallet'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Logika untuk memilih e-wallet
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.codInfo); // Navigasi ke halaman checkout
              },
              child: const Text('Lanjutkan ke Pembayaran', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.pink,
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
