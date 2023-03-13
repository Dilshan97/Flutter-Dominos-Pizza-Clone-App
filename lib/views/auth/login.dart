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
              width: size.width * 0.85,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/dominos-logo.png'),
              ),
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            CustomLabel(
              label: "Login",
              textColor: AppColors.black,
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
              child: CustomLabel(
                label: "Phone number",
                fontSize: size.width * 0.045,
                textColor: AppColors.black,
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
                focusedBorderColor: AppColors.primary,
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
              child: const CustomLabel(
                label: "Password",
                textColor: AppColors.black,
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
            const CustomLabel(
              label: "Forgot Passwod?",
              textColor: AppColors.black,
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            SizedBox(
              width: size.width * 0.80,
              height: size.height * 0.050,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () => {},
                child: const CustomLabel(
                  label: "Login",
                  textColor: AppColors.white,
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
                const CustomLabel(
                  label: "Don’t have an account?",
                  textColor: AppColors.black,
                ),
                GestureDetector(
                  child: const CustomLabel(
                    label: " Sign up",
                    textColor: AppColors.primary,
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
