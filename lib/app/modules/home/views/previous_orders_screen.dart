import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Tambahkan Get untuk navigasi yang lebih mudah
import 'package:project/app/models/pesanan.dart'; // Pastikan Anda memiliki model Order
import 'package:project/app/modules/home/views/order_screen.dart';
import 'package:project/app/routes/routes.dart'; // Pastikan rute sudah didefinisikan

class PreviousOrdersScreen extends StatefulWidget {
  @override
  _PreviousOrdersScreenState createState() => _PreviousOrdersScreenState();
}

class _PreviousOrdersScreenState extends State<PreviousOrdersScreen> {
  bool _showTrackingDetails = false;

  void _toggleTrackingDetails() {
    setState(() {
      _showTrackingDetails = !_showTrackingDetails;
    });
  }

  void _cancelOrder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi Pembatalan"),
        content: Text("Apakah Anda yakin ingin membatalkan pesanan ini?"),
        actions: [
          TextButton(
            onPressed: () {
              // Logika untuk membatalkan pesanan
              Navigator.of(context).pop(); // Tutup dialog
              // Tambahkan logika untuk menghapus pesanan dari database jika perlu

              // Navigasi ke halaman previous_order_screen setelah pembatalan
              Get.offNamed(AppRoutes.previous_order_screen); // Ganti sesuai nama rute
            },
            child: Text("Ya"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Tidak"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Orders'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke HomeScreen
            Get.offAllNamed(AppRoutes.home); // Ganti dengan rute homescreen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol untuk menampilkan/menyembunyikan detail pelacakan
            ElevatedButton(
              onPressed: _toggleTrackingDetails,
              child: Text(_showTrackingDetails ? "Hide Details" : "Show Details"),
            ),
            if (_showTrackingDetails) ...[
              SizedBox(height: 16),
              // Bagian pelacakan
              Column(
                children: [
                  // Contoh pelacakan dengan ikon, informasi, dan waktu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.local_shipping, color: Colors.blue),
                      Expanded(child: Text("Pesanan sedang dalam pengiriman")),
                      Text("10:30 AM"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.done, color: Colors.green),
                      Expanded(child: Text("Pesanan telah dikemas")),
                      Text("09:00 AM"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.schedule, color: Colors.orange),
                      Expanded(child: Text("Pesanan sedang diproses")),
                      Text("08:30 AM"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
            // Daftar pesanan yang dibatalkan
            Expanded(
              child: ListView.builder(
                itemCount: previousOrders.length,
                itemBuilder: (context, index) {
                  final order = previousOrders[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          order.imagePath,
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      title: Text(order.name),
                      subtitle: Text('Harga: \$${order.price.toStringAsFixed(2)}'),
                      trailing: Text(
                        "${order.estimatedArrivalTime.day}/${order.estimatedArrivalTime.month}/${order.estimatedArrivalTime.year}",
                      ),
                    ),
                  );
                },
              ),
            ),
            // Dua bagian untuk bantuan dan pembatalan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke FAQ
                    Get.toNamed(AppRoutes.faq); // Pastikan rute FAQ sudah didefinisikan
                  },
                  child: Text("Help"),
                ),
                ElevatedButton(
                  onPressed: _cancelOrder,
                  child: Text("Cancel Order"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
