import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk menampilkan sapaan berdasarkan waktu
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart'; // Sesuaikan dengan path project Anda

class SupportRequestScreen extends StatelessWidget {
  // Fungsi untuk menampilkan sapaan berdasarkan waktu
  String greetingMessage() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  // Data solusi mockup
  final List<Map<String, String>> solutions = [
    {
      'problem': 'Unable to place an order',
      'solution': 'Please check your internet connection and try again.',
    },
    {
      'problem': 'Payment failed',
      'solution': 'Ensure you have sufficient balance or try another payment method.',
    },
    {
      'problem': 'Delivery delayed',
      'solution': 'Check the tracking number for updated delivery information.',
    },
    // Tambahkan lebih banyak solusi sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Support Request',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Logika untuk pencarian support request
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${greetingMessage()}, John Doe', // Nama user mock, dapat diubah sesuai data user
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type keywords...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Find solutions in the article',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: solutions.length,
              itemBuilder: (context, index) {
                final solution = solutions[index];
                return ListTile(
                  title: Text(solution['problem']!),
                  subtitle: Text(solution['solution']!),
                  onTap: () {
                    // Logika ketika solusi di-tap
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSolutionIcon(Icons.shopping_bag, 'Order'),
                _buildSolutionIcon(Icons.payment, 'Payment'),
                _buildSolutionIcon(Icons.local_shipping, 'Delivery'),
                _buildSolutionIcon(Icons.more_horiz, 'Other'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        selectedItemColor: Colors.pink,
        onTap: (index) {
          // Logika untuk navigasi
        },
      ),
    );
  }

  // Fungsi untuk membangun ikon solusi dengan keterangan
  Widget _buildSolutionIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
