import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';

import '../common/colors.dart';
import '../home/home.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const CustomLabel(
          label: "Profile",
          textColor: AppColors.black,
          textAlign: TextAlign.center,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Home()),
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
