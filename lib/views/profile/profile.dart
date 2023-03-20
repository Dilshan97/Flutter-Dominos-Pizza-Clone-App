import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import '../common/widgets/customAppBar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(name: 'Profile'),
      ),
      body: ListView(
        children: [
          Container(
            width: size.width,
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    "assets/images/man.jpeg",
                    width: size.width * 0.35,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.040,
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
                  width: size.width * 0.80,
                  height: size.height * 0.065,
                  child: CustomInput(
                    controller: _firstNameController,
                    focusedBorderColor: AppColors.primary,
                    hintText: "First Name",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.040,
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
                  width: size.width * 0.80,
                  height: size.height * 0.065,
                  child: CustomInput(
                    controller: _lastNameController,
                    focusedBorderColor: AppColors.primary,
                    hintText: "Last Name",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.040,
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
                  width: size.width * 0.80,
                  height: size.height * 0.065,
                  child: CustomInput(
                    controller: _emailController,
                    focusedBorderColor: AppColors.primary,
                    hintText: "E-mail",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.040,
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
                  width: size.width * 0.80,
                  height: size.height * 0.065,
                  child: CustomInput(
                    controller: _addressController,
                    focusedBorderColor: AppColors.primary,
                    hintText: "Address",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.040,
                ),
                SizedBox(
                  width: size.width * 0.80,
                  child: GestureDetector(
                    child: Container(
                      color: AppColors.primary,
                      padding: EdgeInsets.all(15),
                      width: size.width,
                      child: const CustomLabel(
                        label: "Update",
                        textColor: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
