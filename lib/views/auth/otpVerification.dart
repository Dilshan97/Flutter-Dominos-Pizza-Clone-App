import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/auth/setupDetails.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_notes/views/home/home.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNumber;
  final int? resendToken;
  final String verificationId;

  const OtpVerification({
    super.key,
    required this.phoneNumber,
    required this.resendToken,
    required this.verificationId,
  });

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;
  late FocusNode focusNode5;
  late FocusNode focusNode6;

  final _otpController1 = TextEditingController();
  final _otpController2 = TextEditingController();
  final _otpController3 = TextEditingController();
  final _otpController4 = TextEditingController();
  final _otpController5 = TextEditingController();
  final _otpController6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    focusNode6 = FocusNode();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> verifyOtp() async {
      if (formKey.currentState!.validate()) {
        String smsCode = _otpController1.text +
            _otpController2.text +
            _otpController3.text +
            _otpController4.text +
            _otpController5.text +
            _otpController6.text;

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: smsCode,
        );

        // Sign the user in (or link) with the credential
        await auth
            .signInWithCredential(credential)
            .then(
              (value) => {
                if (value.additionalUserInfo!.isNewUser)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SetupDetails(),
                    ),
                  )
                else
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  )
              },
            )
            .catchError((error) => print(error));
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: size.width,
        child: Form(
          key: formKey,
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
                label: "Verification Code",
                textColor: AppColors.black,
                fontSize: size.width * 0.070,
              ),
              CustomLabel(
                label:
                    "Type the verification code sent to \n the number +${widget.phoneNumber}",
                textColor: AppColors.black,
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
                      child: CustomInput(
                        hintText: "*",
                        controller: _otpController1,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        focusNode: focusNode1,
                        onChanged: () =>
                            FocusScope.of(context).requestFocus(focusNode2),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Otp is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.13,
                      height: size.height * 0.055,
                      child: CustomInput(
                        hintText: "*",
                        controller: _otpController2,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        focusNode: focusNode2,
                        onChanged: () =>
                            FocusScope.of(context).requestFocus(focusNode3),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Otp is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.13,
                      height: size.height * 0.055,
                      child: CustomInput(
                        hintText: "*",
                        controller: _otpController3,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        focusNode: focusNode3,
                        onChanged: () =>
                            FocusScope.of(context).requestFocus(focusNode4),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Otp is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.13,
                      height: size.height * 0.055,
                      child: CustomInput(
                        hintText: "*",
                        controller: _otpController4,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        focusNode: focusNode4,
                        onChanged: () =>
                            FocusScope.of(context).requestFocus(focusNode5),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Otp is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.13,
                      height: size.height * 0.055,
                      child: CustomInput(
                        hintText: "*",
                        controller: _otpController5,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        focusNode: focusNode5,
                        onChanged: () =>
                            FocusScope.of(context).requestFocus(focusNode6),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Otp is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.13,
                      height: size.height * 0.055,
                      child: CustomInput(
                        hintText: "*",
                        controller: _otpController6,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        focusNode: focusNode6,
                        onChanged: () => {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Otp is required';
                          }
                          return null;
                        },
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
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                  ),
                  onPressed: () => verifyOtp(),
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
                    label: "Didn’t recieve the code? ",
                    textColor: AppColors.black,
                  ),
                  GestureDetector(
                    child: const CustomLabel(
                      label: "Resend in 1 Min",
                      textColor: AppColors.primary,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
