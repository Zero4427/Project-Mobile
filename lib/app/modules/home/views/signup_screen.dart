import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo aplikasi
              Image.asset(
                'assets/logo.png', // Gambar logo
                height: 80,
              ),
              const SizedBox(height: 32),
              const Text(
                'Create Your Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Input Email
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Input your email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              // Input Password
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Input your password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              // Input Confirm Password
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              // Tombol Sign Up
              ElevatedButton(
                onPressed: () {
                  // Implementasi logika sign up
                  // Setelah berhasil sign up, navigasi ke login
                  Get.toNamed(AppRoutes.login);
                },
                child: const Text('SIGN UP', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'or Login with:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Tombol login sosial media
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialLoginButton('facebook', Colors.blue, Icons.facebook),
                  const SizedBox(width: 16),
                  _socialLoginButton('google', Colors.red, Icons.mail),
                  const SizedBox(width: 16),
                  _socialLoginButton('apple', Colors.black, Icons.apple),
                ],
              ),
              const SizedBox(height: 24),
              // Tautan kembali ke login screen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I have an account? "),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.login); // Navigasi kembali ke login
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton(String platform, Color color, IconData icon) {
    return InkWell(
      onTap: () {
        // Implementasi logika login sosial media
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
