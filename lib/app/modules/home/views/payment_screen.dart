import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigasi kembali
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Option',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildPaymentOptions(),
            const SizedBox(height: 16),
            _buildPromoCodeSection(),
            const SizedBox(height: 16),
            _buildPriceDetails(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Logic untuk navigasi ke halaman COD info atau transaksi sukses
                Get.toNamed(AppRoutes.codInfo); // Ganti sesuai dengan rute yang ada
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Checkout', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/CoD.png'), // Ganti dengan gambar COD
          title: const Text('Cash on Delivery'),
          onTap: () {
            // Logic untuk memilih opsi ini
          },
        ),
        ListTile(
          leading: Image.asset('assets/credit.png'), // Ganti dengan gambar kartu kredit
          title: const Text('Debit/Credit Card'),
          onTap: () {
            // Logic untuk memilih opsi ini
          },
        ),
        ListTile(
          leading: Image.asset('assets/dompet.png'), // Ganti dengan gambar e-wallet
          title: const Text('E-Wallet'),
          onTap: () {
            // Logic untuk memilih opsi ini
          },
        ),
      ],
    );
  }

  Widget _buildPromoCodeSection() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Promo Code',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            // Logic untuk menerapkan promo code
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }

  Widget _buildPriceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Subtotal: Rp. 12,000,000'), // Ganti dengan harga dinamis
        const Text('Delivery: Rp. 10,000'), // Ganti dengan biaya pengiriman dinamis
        const Divider(),
        const Text('Total: Rp. 12,010,000'), // Hitung total sesuai promo
      ],
    );
  }
}
