import 'package:flutter/material.dart';


import '../../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengatur navigasi setelah 5 detik
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    });

    // Menggunakan MediaQuery untuk mendapatkan ukuran layar
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // Menampilkan gambar di tengah
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  width: size.width * 1, // Menggunakan proporsi dari lebar layar
                  height: size.width * 0.8, // Menggunakan proporsi dari lebar layar
                  fit: BoxFit.contain, // Menyesuaikan gambar agar sesuai dengan ukuran
                ),
              ),
              const SizedBox(height: 20), // Spacing di bawah gambar
            // Menampilkan loading bar
              Container(
                width: size.width * 0.35, // Menggunakan proporsi dari lebar layar
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ],
          ),
        ),  
      ),
    );
  }
}
