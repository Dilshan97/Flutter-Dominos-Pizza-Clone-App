import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customInput.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_notes/views/profile/viewProfile.dart';
import '../common/widgets/customAppBar.dart';
import '../splash.dart';
import 'widget/profileMenuItem.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void signout() {
    FirebaseAuth.instance
        .signOut()
        .then(
          (value) => {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Splash(),
              ),
            )
          },
        )
        .onError((error, stackTrace) => {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(name: 'Profile'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width * 0.95,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.030,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage(
                      "assets/images/man.jpeg",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomLabel(
                          label: "Dilshan Ramesh",
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Poppins-Regular',
                        ),
                        const CustomLabel(
                          label: "dilshanramesh81@gmail.com",
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins-Light',
                          fontSize: 14,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ViewProfile(),
                            ),
                          ),
                          child: const CustomLabel(
                            label: "View My Profile",
                            textColor: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              SizedBox(
                width: size.width * 0.80,
                child: Column(
                  children: [
                    ProfileMenuItem(
                      title: 'Change Password',
                      subTitle: 'Change your password',
                      icon: Icons.lock,
                      onclick: () => {},
                      divide: true,
                    ),
                    ProfileMenuItem(
                      title: 'Delivery Locations',
                      subTitle: 'Add your delivery locations',
                      icon: Icons.location_pin,
                      onclick: () => {},
                      divide: true,
                    ),
                    ProfileMenuItem(
                      title: 'Refer to Friends',
                      subTitle: 'Get Rs.100 reffering friends',
                      icon: Icons.share,
                      onclick: () => {},
                      divide: true,
                    ),
                    ProfileMenuItem(
                      title: 'Rate Us',
                      subTitle: 'Rate us palystore & appstore',
                      icon: Icons.star,
                      onclick: () => {},
                      divide: true,
                    ),
                    ProfileMenuItem(
                      title: 'FAQ`s',
                      subTitle: 'Ask questions about service',
                      icon: Icons.question_mark,
                      onclick: () => {},
                      divide: true,
                    ),
                    ProfileMenuItem(
                      title: 'Privacy Policy',
                      subTitle: 'Ask questions about service',
                      icon: Icons.privacy_tip,
                      onclick: () => {},
                      divide: true,
                    ),
                    ProfileMenuItem(
                      title: 'Logout',
                      subTitle: 'Logout from application',
                      icon: Icons.logout,
                      onclick: () => signout(),
                      divide: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
