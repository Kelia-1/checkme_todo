import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorText;

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (!email.contains('@') || password.length < 6) {
      setState(() {
        errorText = 'Please enter a valid email and password (min 6 chars)';
      });
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(userName: email.split('@')[0]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade50, Colors.indigo.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
                    ],
                  ),
                  child: Icon(Icons.check_circle_rounded, size: 56, color: Colors.indigo),
                ),
                SizedBox(height: 24),
                Text(
                  'CheckMe',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'by Ihirwe Kellia',
                  style: TextStyle(color: Colors.indigo.shade700),
                ),
                SizedBox(height: 24),
                if (errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      errorText!,
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _login,
                  icon: Icon(Icons.login),
                  label: Text('Sign in'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Welcome back — let\'s check things off today!',
                  style: TextStyle(color: Colors.indigo.shade800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}