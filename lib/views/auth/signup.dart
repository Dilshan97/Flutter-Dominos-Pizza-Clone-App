import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/auth/login.dart';
import 'package:flutter_notes/views/auth/otpVerification.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController(text: "94771854709");

  Future<void> _verifyPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OtpVerification(
            phoneNumber: _phoneController.text,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: size.width,
        child: Form(
          key: _formKey,
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
                label: "Welcome!",
                textColor: AppColors.black,
                fontSize: size.width * 0.070,
              ),
              const CustomLabel(
                label:
                    "Enter your phone number. We will \n send you a verification code.",
                textColor: AppColors.black,
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
                  textColor: AppColors.black,
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(
                width: size.width * 0.060,
                height: size.height * 0.020,
              ),
              SizedBox(
                width: size.width * 0.80,
                height: size.height * 0.055,
                child: CustomInput(
                  hintText: "+94 77 000 000",
                  focusedBorderColor: AppColors.primary,
                  controller: _phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
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
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                  ),
                  onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {_verifyPhoneNumber()}
                  },
                  child: const CustomLabel(
                    label: "Continue",
                    textColor: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomLabel(
                    label: "Already have an account? ",
                    textColor: AppColors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const CustomLabel(
                      label: "Sign in",
                      textColor: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.090,
              ),
              const CustomLabel(
                label:
                    "By continuing, you agree to our Terms & \n Conditions and Privacy Policy",
                textColor: AppColors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
