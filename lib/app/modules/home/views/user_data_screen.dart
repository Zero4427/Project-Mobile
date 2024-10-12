import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data User', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Profil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/cost.png'), // Ganti dengan foto pengguna
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Logika untuk mengganti foto menggunakan image picker
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Info Profile
            const Text('Info Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildTextField('Nama'),
            _buildTextField('Username'),
            _buildTextField('Bio'),

            const SizedBox(height: 20),

            // Info Pribadi
            const Text('Info Pribadi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildTextField('User ID', isEditable: false),
            _buildTextField('Email'),
            _buildTextField('Nomor HP'),
            _buildTextField('Jenis Kelamin'),
            _buildTextField('Tanggal Lahir'),

            const SizedBox(height: 20),

            // Tutup Akun
            ElevatedButton(
              onPressed: () {
                // Logika untuk menutup akun dan kembali ke halaman login
                Get.toNamed('/login'); // Ganti dengan rute halaman login Anda
              },
              child: const Text('Tutup Akun'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
        ],
        selectedItemColor: Colors.pink,
        onTap: (index) {
          // Navigasi bottom bar
          switch (index) {
            case 0:
              Get.toNamed('/home'); // Ganti dengan rute home
              break;
            case 1:
              Get.toNamed('/favorites'); // Ganti dengan rute favorites
              break;
            case 2:
              Get.toNamed('/messages'); // Ganti dengan rute messages
              break;
            case 3:
              Get.toNamed('/cart'); // Ganti dengan rute cart
              break;
          }
        },
      ),
    );
  }

  Widget _buildTextField(String label, {bool isEditable = true}) {
    return TextField(
      enabled: isEditable,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
