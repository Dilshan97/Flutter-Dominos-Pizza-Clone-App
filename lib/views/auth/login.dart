import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/auth/signup.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';

import '../common/widgets/customLabel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
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
              height: size.height * 0.010,
            ),
            CustomLabel(
              label: "Login",
              textColor: AppColors.secondary,
              fontSize: size.width * 0.070,
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: size.width * 0.095,
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
            SizedBox(
              width: size.width * 0.80,
              height: size.height * 0.055,
              child: const CustomInput(
                hintText: "+94 77 000 000",
              ),
            ),
            SizedBox(
              width: size.width * 0.060,
              height: size.height * 0.020,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: size.width * 0.095,
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
              height: size.height * 0.055,
              width: size.width * 0.80,
              child: TextField(
                obscureText: _obscureText,
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
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 181, 33),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
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
              height: size.height * 0.050,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    " Sign up",
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: Color.fromARGB(255, 255, 181, 33),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
