import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:project/app/models/pesanan.dart';
import 'package:project/app/routes/routes.dart'; // Sesuaikan dengan rute proyek Anda

// Daftar pesanan yang dibatalkan (Previous Orders)
List<Order> previousOrders = [];

// Daftar pesanan saat ini
List<Order> currentOrders = [
  Order(
    name: 'iPhone 15',
    price: 100,
    imagePath: 'assets/ip15.png',
    estimatedArrivalTime: DateTime.now(),
  ),
];

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _remainingSeconds = 3600; // Misalnya 1 jam (3600 detik)
  Timer? _timer;

  String _getEstimatedArrivalTime() {
    DateTime now = DateTime.now();
    DateTime estimatedTime = now.add(Duration(seconds: _remainingSeconds));
    return "${estimatedTime.toLocal().day}/${estimatedTime.toLocal().month}/${estimatedTime.toLocal().year} "
           "${estimatedTime.hour}:${estimatedTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _showOrderDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Detail Pesanan"),
        content: Text("Ini adalah detail dari pesanan Anda."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Tutup"),
          ),
        ],
      ),
    );
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
              // Tambahkan pesanan ke daftar pesanan yang dibatalkan
              previousOrders.add(currentOrders[0]); // Tambahkan pesanan saat ini ke previousOrders
              currentOrders.removeAt(0); // Hapus pesanan saat ini dari currentOrders

              Navigator.of(context).pop();

              // Arahkan ke previous_order_screen setelah pembatalan
              Get.offNamed(AppRoutes.previous_order_screen);
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

  void _leaveReview() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Tulis Ulasan"),
        content: TextField(
          decoration: InputDecoration(hintText: "Tulis ulasan Anda di sini..."),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Kirim"),
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
          onPressed: () {
            // Arahkan kembali ke HomeScreen
            Get.offNamed(AppRoutes.home);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Current'),
                      Tab(text: 'Previous'),
                    ],
                  ),
                  Container(
                    height: 600, // Berikan tinggi yang cukup untuk menampung konten
                    child: TabBarView(
                      children: [
                        // Tab "Current Orders"
                        currentOrders.isNotEmpty ? Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                currentOrders[0].imagePath,
                                fit: BoxFit.cover,
                                height: 160,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Harga: \$${currentOrders[0].price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text('Estimasi Waktu Datang:', style: TextStyle(fontSize: 16)),
                            Text(_getEstimatedArrivalTime(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text('Estimasi Waktu: ${_remainingSeconds ~/ 60} menit ${_remainingSeconds % 60} detik'),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _showOrderDetails,
                              child: Text("Lihat Detail Pesanan"),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _cancelOrder,
                              child: Text("Batalkan Pesanan"),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _leaveReview,
                              child: Text("Tulis Ulasan"),
                            ),
                          ],
                        ) : Center(
                          child: Text('Tidak ada pesanan saat ini.'),
                        ),
                        // Tab "Previous Orders", menampilkan daftar pesanan yang dibatalkan
                        ListView.builder(
                          itemCount: previousOrders.length,
                          itemBuilder: (context, index) {
                            final order = previousOrders[index];
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  order.imagePath,
                                  fit: BoxFit.cover,
                                  height: 60,
                                ),
                              ),
                              title: Text(order.name),
                              subtitle: Text('Harga: \$${order.price.toStringAsFixed(2)}'),
                              trailing: Text(
                                "${order.estimatedArrivalTime.day}/${order.estimatedArrivalTime.month}/${order.estimatedArrivalTime.year}",
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
