import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';

import '../common/widgets/customAppBar.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(name: 'View Profile'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CustomLabel(
                label: "Name",
                textColor: AppColors.black,
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: CustomInput(
                controller: null,
                hintText: "Enter your name",
              ),
            ),
            SizedBox(
              child: CustomLabel(
                label: "E-mail",
                textColor: AppColors.black,
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: CustomInput(
                controller: null,
                hintText: "Enter your email",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
