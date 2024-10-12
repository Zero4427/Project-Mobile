import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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
              Navigator.of(context).pop();
              // Tambahkan logika untuk menghapus pesanan dari database jika perlu
              Navigator.of(context).pop(); // Kembali ke layar sebelumnya
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
        title: Text('Order Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
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
            // Dua bagian untuk bantuan dan pembatalan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke FAQ
                    Navigator.pushNamed(context, '/faq');
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
