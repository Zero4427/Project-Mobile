import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'productName': 'Apple iPhone 15 Pro 256GB Black Titanium',
      'productImage': 'assets/ip15.png',
      'productColor': 'Black',
      'quantity': 1,
    },
    {
      'productName': 'Samsung Galaxy S23',
      'productImage': 'assets/s23.png',
      'productColor': 'White',
      'quantity': 2,
    },
  ];

  bool isEditing = false;

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] += change;
      if (cartItems[index]['quantity'] <= 0) {
        cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart', // Perbaikan dari 'My Charts' menjadi 'My Cart'
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _toggleEdit,
            child: Text(
              isEditing ? 'Done' : 'Edit',
              style: const TextStyle(color: Colors.pink),
            ),
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item['productImage']),
                  title: Text(item['productName']),
                  subtitle: Text('Color: ${item['productColor']}'),
                  trailing: isEditing
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => _updateQuantity(index, -1),
                            ),
                            Text('${item['quantity']}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => _updateQuantity(index, 1),
                            ),
                          ],
                        )
                      : Text('Qty: ${item['quantity']}'),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity, // Memastikan tombol memenuhi lebar layar
            child: ElevatedButton(
              onPressed: () {
                // Logic for proceeding to checkout
                Get.toNamed(AppRoutes.checkout);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  color: Colors.white, // Teks berwarna putih
                  fontSize: 18, // Ukuran teks lebih besar agar terlihat jelas
                  fontWeight: FontWeight.bold, // Membuat teks lebih tebal
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
