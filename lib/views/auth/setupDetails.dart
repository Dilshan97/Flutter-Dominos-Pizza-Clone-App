import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';

import '../home/home.dart';

class SetupDetails extends StatefulWidget {
  const SetupDetails({super.key});

  @override
  State<SetupDetails> createState() => _SetupDetailsState();
}

class _SetupDetailsState extends State<SetupDetails> {
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
              label: "Complete your \n Profile",
              textColor: AppColors.black,
              fontSize: size.width * 0.070,
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: size.width * 0.095,
              ),
              child: CustomLabel(
                label: "Name",
                textColor: AppColors.black,
                fontSize: size.width * 0.045,
              ),
            ),
            SizedBox(
              height: size.height * 0.016,
            ),
            SizedBox(
              height: size.height * 0.055,
              width: size.width * 0.80,
              child: CustomInput(
                controller: _nameController,
                obscureText: true,
                hintText: "Name Here",
                focusedBorderColor: AppColors.primary,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
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
              child: CustomLabel(
                label: "Password",
                fontSize: size.width * 0.045,
                textColor: AppColors.black,
              ),
            ),
            SizedBox(
              height: size.height * 0.016,
            ),
            SizedBox(
              height: size.height * 0.055,
              width: size.width * 0.80,
              child: CustomInput(
                controller: _passwordController,
                hintText: "Password Here",
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
                    color: AppColors.black,
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
              child: CustomLabel(
                label: "Confirm Password",
                textColor: AppColors.black,
                fontSize: size.width * 0.045,
              ),
            ),
            SizedBox(
              height: size.height * 0.016,
            ),
            SizedBox(
              height: size.height * 0.055,
              width: size.width * 0.80,
              child: CustomInput(
                controller: _confirmPasswordController,
                obscureText: true,
                hintText: "Confirm Password Here",
                focusedBorderColor: AppColors.primary,
                keyboardType: const TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
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
                    color: AppColors.black,
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
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () => {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()),
                  )
                },
                child: const CustomLabel(
                  label: 'Register',
                  textColor: AppColors.white,
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
