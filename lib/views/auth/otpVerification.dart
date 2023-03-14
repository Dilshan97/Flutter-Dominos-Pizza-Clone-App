import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/auth/setupDetails.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';

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
  late FocusNode focusNode1;
  late FocusNode focusNode2;

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
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    setupDetails() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SetupDetails()),
      );
    }

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
                      // onChanged: (_) => focusNode2.requestFocus(),
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
                onPressed: () => setupDetails(),
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
    );
  }
}
