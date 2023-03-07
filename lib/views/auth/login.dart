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
            Container(
              width: size.width * 0.55,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.070,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Phone number",
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: Colors.white,
                  fontFamily: 'Poppins-Regular',
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.060,
              height: size.height * 0.020,
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              height: size.height * 0.055,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                controller: _emailController,
                style: const TextStyle(
                  height: 1.5,
                  fontFamily: 'Poppins-Regular',
                ),
                decoration: InputDecoration(
                  hintText: "+94 000-000-000",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.060,
              height: size.height * 0.020,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Password",
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: Colors.white,
                  fontFamily: 'Poppins-Regular',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.016,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10, left: 10),
              height: size.height * 0.055,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                controller: _passwordController,
                style: const TextStyle(
                  height: 1.5,
                  fontFamily: 'Poppins-Regular',
                ),
                decoration: InputDecoration(
                  hintText: "Password Here",
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins-Regular',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            const Text(
              "Forgot Passwod?",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Regular',
              ),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            SizedBox(
              width: size.width * 0.80,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 181, 33),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => {},
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            const Text(
              "Don’t have an account? Sign up",
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
