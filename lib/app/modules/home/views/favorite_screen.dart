import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'productName': 'Apple iPhone 15 Pro',
      'productImage': 'assets/ip15.png',
      'productPrice': 'Rp. 12,000,000',
      'stock': 'In Stock',
    },
    {
      'productName': 'Samsung Galaxy S23',
      'productImage': 'assets/s23.png',
      'productPrice': 'Rp. 10,000,000',
      'stock': 'In Stock',
    },
    // Tambahkan lebih banyak item favorit di sini
  ];

  // Fungsi untuk menghapus item dari daftar favorit
  void _removeFromFavorites(int index) {
    setState(() {
      favoriteItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: favoriteItems.isEmpty
          ? Center(child: Text('No favorites yet'))
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(item['productImage']),
                    title: Text(item['productName']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['productPrice']),
                        Text(item['stock']),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () => _removeFromFavorites(index),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        currentIndex: 1, // Set to the index of favorites
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoutes.home); // Navigasi ke halaman Home
              break;
            case 1:
              Get.toNamed(AppRoutes.favorite); // Tetap di Favorite
              break;
            case 2:
              Get.toNamed(AppRoutes.messages); // Navigasi ke halaman Messages
              break;
            case 3:
              Get.toNamed(AppRoutes.order); // Navigasi ke halaman Order
              break;
            case 4:
              Get.toNamed(AppRoutes.cart); // Navigasi ke halaman Cart
              break;
          }
        },
      ),
    );
  }
}
