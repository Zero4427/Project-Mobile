import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Mock data for categories and products
  final List<Map<String, String>> popularItems = [
    {'name': 'Discount Item 1', 'image': 'assets/jordan.png', 'price': 'Rp. 12,000,000'},
    {'name': 'Discount Item 2', 'image': 'assets/xiaomi.png', 'price': 'Rp. 2,500,000'},
    {'name': 'Discount Item 3', 'image': 'assets/ysl.png', 'price': 'Rp. 1,500,000'},
  ];

  final List<Map<String, String>> categories = [
    {'name': 'Shoes', 'image': 'assets/nike.png'},
    {'name': 'Phone', 'image': 'assets/xt.png'},
    {'name': 'Perfume', 'image': 'assets/hmns.png'},
  ];

  void _onItemTapped(int index) {
    // Memperbarui indeks yang dipilih
    setState(() {
      _selectedIndex = index;
    });

    print("Navigating to index: $index");

    // Navigasi berdasarkan indeks yang dipilih
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.home); // Navigasi ke halaman home
        break;
      case 1:
        Get.toNamed(AppRoutes.favorite); // Navigasi ke halaman favorite
        break;
      case 2:
      print("Navigating to MessageScreen");
        Get.toNamed(AppRoutes.messages); // Navigasi ke halaman message
        break;
      case 3:
        Get.toNamed(AppRoutes.order); // Navigasi ke halaman order
        break;
      case 4:
        Get.toNamed(AppRoutes.cart); // Navigasi ke halaman keranjang
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Sticky Search Bar
          _buildSearchBar(),
          // Scrollable content below the search bar
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPopularItems(), // Horizontal scrollable Popular Items
                  _buildCategories(),   // Horizontal scrollable Categories
                  _buildFlashSale(),    // Flash Sale section
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.person, color: Colors.black),
        onPressed: () {
          Get.toNamed(AppRoutes.profile); // Navigasi ke halaman profil
        },
      ),
      title: const Text('Welcome, User', style: TextStyle(color: Colors.black)), // Menampilkan nama pengguna
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.black), // Ikon keranjang
          onPressed: () {
            Get.toNamed(AppRoutes.cart); // Navigasi ke halaman keranjang
          },
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to promo page
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text(
            'Promo',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildPopularItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Popular Items',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150, // Height untuk list horizontal
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Scrollable secara horizontal
            itemCount: popularItems.length,
            itemBuilder: (context, index) {
              return _buildPopularItemCard(popularItems[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularItemCard(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          // Navigasi ke ProductScreen dengan parameter
          Get.toNamed(AppRoutes.product, arguments: {
            'productName': item['name'],
            'productImage': item['image'],
            'productPrice': item['price'], // Menggunakan harga dinamis
            'productDescription': 'Deskripsi produk di sini...', // Ganti dengan deskripsi yang sesuai
          });
        },
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white),
          ),
          child: Column(
            children: [
              Image.asset(item['image']!, height: 80),
              const SizedBox(height: 10),
              Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(item['price']!), // Menampilkan harga produk
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 120, // Height untuk list horizontal
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Scrollable secara horizontal
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryCard(categories[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextButton(
            onPressed: () {
              // Handle view more categories
            },
            child: const Text('View More'),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(Map<String, String> category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 100, // Width untuk kategori card
        child: Column(
          children: [
            Image.asset(category['image']!, height: 60),
            const SizedBox(height: 10),
            Text(category['name']!),
          ],
        ),
      ),
    );
  }

  Widget _buildFlashSale() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Flash Sale',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle view more flash sale
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: const Text('View More', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150, // Height untuk list horizontal
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Scrollable secara horizontal
            itemCount: popularItems.length, // Use flash sale items here
            itemBuilder: (context, index) {
              return _buildPopularItemCard(popularItems[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Order'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped, // Menghubungkan fungsi dengan onTap
    );
  }
}
