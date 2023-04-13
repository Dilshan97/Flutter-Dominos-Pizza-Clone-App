import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/auth/signup.dart';
import 'package:flutter_notes/views/base.dart';
import 'package:flutter_notes/views/common/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    User? user = auth.currentUser;
    Timer(const Duration(seconds: 2), () {
      // Navigate to the home screen after 2 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => user == null ? const SignUp() : const Base(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.30,
            ),
            Image.asset('assets/images/dominos-logo.png'),
            SizedBox(
              height: size.height * 0.30,
            ),
            const Text(
              "v1.0.0",
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
