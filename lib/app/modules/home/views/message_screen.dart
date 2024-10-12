import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart'; // Ganti dengan path routes Anda

class MessageScreen extends StatelessWidget {
  // Mock data untuk pesan
  final List<Map<String, dynamic>> messages = [
    {
      'name': 'John Doe',
      'lastMessage': 'Hey, how are you?',
      'time': '2m ago',
      'profileImage': 'assets/JD.png', // Perhatikan lokasi gambar
    },
    {
      'name': 'Jane Smith',
      'lastMessage': 'Let\'s meet tomorrow.',
      'time': '5m ago',
      'profileImage': 'assets/JS.png', // Perhatikan lokasi gambar
    },
    {
      'name': 'Michael Lee',
      'lastMessage': 'Got the project files?',
      'time': '1h ago',
      'profileImage': 'assets/ML.png', // Perhatikan lokasi gambar
    },
    {
      'name': 'Emily Brown',
      'lastMessage': 'See you soon!',
      'time': '3h ago',
      'profileImage': 'assets/EB.png', // Perhatikan lokasi gambar
    },
    // Tambahkan data pesan lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Logika untuk pencarian pesan
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length, // Menggunakan data pesan
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(message['profileImage']),
            ),
            title: Text(message['name'] ?? 'Unknown'), // Pastikan nama ada
            subtitle: Text(message['lastMessage'] ?? 'No message'), // Pastikan pesan ada
            trailing: Text(message['time'] ?? ''), // Pastikan waktu ada
            onTap: () {
              // Navigasi ke halaman detail chat menggunakan GetX
              Get.toNamed(AppRoutes.chatDetail, arguments: message);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logika untuk menambah orang baru yang akan berkomunikasi
        },
        child: const Icon(Icons.add),
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
          }
        },
      ),
    );
  }
}
