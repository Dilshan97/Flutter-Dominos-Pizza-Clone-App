import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class SetupDetails extends StatefulWidget {
  const SetupDetails({super.key});

  @override
  State<SetupDetails> createState() => _SetupDetailsState();
}

class _SetupDetailsState extends State<SetupDetails> {
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

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
              "Complete your \n Profile",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.070,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: size.width * 0.095,
              ),
              child: Text(
                "Name",
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
            SizedBox(
              height: size.height * 0.055,
              width: size.width * 0.80,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  height: 1.5,
                  fontFamily: 'Poppins-Regular',
                ),
                decoration: InputDecoration(
                  hintText: "Name Here",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
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
              height: size.height * 0.030,
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
            SizedBox(
              height: size.height * 0.055,
              width: size.width * 0.80,
              child: TextFormField(
                keyboardType: TextInputType.number,
                obscureText: _obscurePasswordText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  height: 1.5,
                  fontFamily: 'Poppins-Regular',
                ),
                decoration: InputDecoration(
                  hintText: "Password Here",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscurePasswordText = !_obscurePasswordText;
                      });
                    },
                    child: Icon(
                      _obscurePasswordText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: size.width * 0.095,
              ),
              child: Text(
                "Confirm Password",
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
            SizedBox(
              height: size.height * 0.055,
              width: size.width * 0.80,
              child: TextFormField(
                obscureText: _obscureConfirmPasswordText,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  height: 1.5,
                  fontFamily: 'Poppins-Regular',
                ),
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureConfirmPasswordText =
                            !_obscureConfirmPasswordText;
                      });
                    },
                    child: Icon(
                      _obscureConfirmPasswordText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
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
                onPressed: () => {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()),
                  )
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.040,
            ),
          ],
        ),
      ),
    );
  }
}
