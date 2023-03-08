import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              height: size.height * 0.010,
            ),
            Text(
              "Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.070,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            const Text(
              "Enter your phone number. We will \n send you a verification code.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Medium',
              ),
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
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
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
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 181, 33),
                      width: 2.0,
                    ),
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.040,
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
                  'Continue',
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
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 181, 33),
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.090,
            ),
            const Text(
              "By continuing, you agree to our Terms & \n Conditions and Privacy Policy",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Regular',
              ),
            )
          ],
        ),
      ),
    );
  }
}
