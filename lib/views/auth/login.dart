import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.100,
              height: size.height * 0.000,
            ),
            Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.060,
              ),
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            Text(
              "Phone number",
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "+94 000-000-000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.060,
              height: size.height * 0.040,
            ),
            Text(
              "Password",
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password Here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.057,
            ),
            const Text(
              "Forgot Passwod?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () => {},
              child: const Text('Login'),
            ),
            SizedBox(
              height: size.height * 0.056,
            ),
            const Text(
              "Don’t have an account? Sign up",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
