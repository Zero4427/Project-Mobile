import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/app/routes/routes.dart'; // Ganti dengan path routes Anda

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool isSellerTab = true;

  // Mock data pertanyaan FAQ
  final List<Map<String, String>> sellerFAQ = [
    {'question': 'How to manage my shop?', 'answer': 'Here\'s how you can manage your shop...'},
    {'question': 'How to create a listing?', 'answer': 'To create a listing...'},
  ];

  final List<Map<String, String>> buyerFAQ = [
    {'question': 'How to track my order?', 'answer': 'You can track your order...'},
    {'question': 'How to request a refund?', 'answer': 'To request a refund...'},
  ];

  // Method untuk menampilkan sapaan berdasarkan waktu
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
        title: const Text('FAQ', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs untuk Seller dan Buyer
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSellerTab = true;
                    });
                  },
                  child: Container(
                    color: isSellerTab ? Colors.pink : Colors.grey[300],
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: const Text('Seller FAQ'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSellerTab = false;
                    });
                  },
                  child: Container(
                    color: !isSellerTab ? Colors.pink : Colors.grey[300],
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: const Text('Buyer Support Request'),
                  ),
                ),
              ),
            ],
          ),

          // Sapaan berdasarkan waktu dan nama pengguna
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${getGreeting()}, John Doe', // Ubah sesuai dengan data user
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type keywords',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // List pertanyaan FAQ
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: isSellerTab ? sellerFAQ.length : buyerFAQ.length,
              itemBuilder: (context, index) {
                final faq = isSellerTab ? sellerFAQ[index] : buyerFAQ[index];
                return ExpansionTile(
                  title: Text(faq['question']!),
                  children: [Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faq['answer']!),
                  )],
                );
              },
            ),
          ),

          // Topik berdasarkan kategori
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('A topic according to your constraints',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryIcon('Order', Icons.shopping_bag),
              buildCategoryIcon('Payment', Icons.credit_card),
              buildCategoryIcon('Delivery', Icons.local_shipping),
              buildCategoryIcon('Other', Icons.more_horiz),
            ],
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

  // Widget untuk ikon kategori
  Column buildCategoryIcon(String label, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.pink,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
