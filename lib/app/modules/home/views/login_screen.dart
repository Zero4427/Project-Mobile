import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    // Implement login logic here
    print('Login attempt with: ${_emailController.text}, ${_passwordController.text}');
    Get.toNamed(AppRoutes.home);
    // Tambahkan logika login sesuai kebutuhan
  }

  void _handleSocialLogin(String platform) {
    // Implement social login logic here
    print('Social login attempt with: $platform');
    // Tambahkan logika login sosial sesuai kebutuhan
  }

  void _handleSignUp() {
    // Implement navigation to sign up page
    Get.toNamed(AppRoutes.signup); // Menggunakan GetX untuk navigasi
  }

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
              Image.asset(
                'assets/logo.png', // Gambar logo Uswah Shop
                height: 100,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Input email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('LOGIN', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'or Login with :',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account? "),
                  GestureDetector(
                    onTap: _handleSignUp,
                    child: const Text(
                      'Sign Up',
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
      onTap: () => _handleSocialLogin(platform),
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
