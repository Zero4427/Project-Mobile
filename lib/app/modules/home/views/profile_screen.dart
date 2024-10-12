import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart'; // Ganti dengan path routes Anda

class ProfileScreen extends StatelessWidget {
  // Fungsi untuk mendapatkan sapaan berdasarkan waktu saat ini
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigasi kembali ke home screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sapaan dan Nama Pengguna
            Text(
              getGreeting(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'John Doe', // Nama pengguna diambil dari data user
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Type keywords...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),

            // Personal Information Section
            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('User Data'),
              onTap: () {
                // Navigasi ke halaman detail user data
                Get.toNamed(AppRoutes.userData);
              },
            ),
            ListTile(
              leading: const Icon(Icons.discount),
              title: const Text('Promo Codes'),
              onTap: () {
                // Navigasi ke halaman promo codes
                Get.toNamed(AppRoutes.promoCodes);
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Payments'),
              onTap: () {
                // Navigasi ke halaman payments
                Get.toNamed(AppRoutes.payments);
              },
            ),
            const SizedBox(height: 16),

            // Help and Support Section
            const Text(
              'Help and Support',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Support Request'),
              onTap: () {
                // Navigasi ke halaman support request
                Get.toNamed(AppRoutes.supportRequest);
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQ'),
              onTap: () {
                // Navigasi ke halaman FAQ
                Get.toNamed(AppRoutes.faq);
              },
            ),
          ],
        ),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.pink,
        onTap: (index) {
          // Navigasi bottom bar
          switch (index) {
            case 0:
              Get.toNamed(AppRoutes.home);
              break;
            case 1:
              Get.toNamed(AppRoutes.favorite);
              break;
            case 2:
              Get.toNamed(AppRoutes.messages);
              break;
            case 3:
              Get.toNamed(AppRoutes.cart);
              break;
            case 4:
              Get.toNamed(AppRoutes.profile); // Sudah di halaman profile
              break;
          }
        },
      ),
    );
  }
}
