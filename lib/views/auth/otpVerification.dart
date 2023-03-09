import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNumber;

  const OtpVerification({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    setupDetails() {}

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
              "Verification Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.070,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            Text(
              "Type the verification code sent to \n the number +${widget.phoneNumber}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Medium',
              ),
            ),
            SizedBox(
              height: size.height * 0.040,
            ),
            SizedBox(
              width: size.width * 0.90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.13,
                    height: size.height * 0.055,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 2.5,
                        fontFamily: 'Poppins-Regular',
                      ),
                      decoration: InputDecoration(
                        hintText: "*",
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
                    width: size.width * 0.13,
                    height: size.height * 0.055,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.5,
                        fontFamily: 'Poppins-Regular',
                      ),
                      decoration: InputDecoration(
                        hintText: "*",
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
                    width: size.width * 0.13,
                    height: size.height * 0.055,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.5,
                        fontFamily: 'Poppins-Regular',
                      ),
                      decoration: InputDecoration(
                        hintText: "*",
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
                    width: size.width * 0.13,
                    height: size.height * 0.055,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.5,
                        fontFamily: 'Poppins-Regular',
                      ),
                      decoration: InputDecoration(
                        hintText: "*",
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
                    width: size.width * 0.13,
                    height: size.height * 0.055,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.5,
                        fontFamily: 'Poppins-Regular',
                      ),
                      decoration: InputDecoration(
                        hintText: "*",
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
                    width: size.width * 0.13,
                    height: size.height * 0.055,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.5,
                        fontFamily: 'Poppins-Regular',
                      ),
                      decoration: InputDecoration(
                        hintText: "*",
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
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              width: size.width * 0.80,
              height: size.height * 0.050,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 181, 33),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => setupDetails(),
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
                  "Didn’t recieve the code? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "Resend in 1 Min",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 181, 33),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
