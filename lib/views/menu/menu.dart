import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_notes/views/home/home.dart';

import '../../models/category.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedCategory = 0;

  void initState() {
    super.initState();
  }

  final categoryRef =
      FirebaseFirestore.instance.collection('categories').withConverter(
            fromFirestore: Category.fromFirestore,
            toFirestore: (Category category, _) => category.toFirestore(),
          );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const CustomLabel(
          label: "Explore Menu",
          textColor: AppColors.black,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          fontSize: 18,
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
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 11,
            child: StreamBuilder<QuerySnapshot<Category>>(
              stream: categoryRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                final data = snapshot.requireData;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.size,
                  itemBuilder: (itemBuilder, index) => Container(
                    margin: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () => {
                        setState(() => {selectedCategory = index})
                      },
                      child: Container(
                        decoration: index == selectedCategory
                            ? const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.primary,
                                    width: 2.0,
                                  ),
                                ),
                              )
                            : null,
                        child: CustomLabel(
                          label: data.docs[index]['name'].toUpperCase(),
                          textColor: AppColors.black,
                          fontFamily: 'Poppins-Regular',
                          fontWeight: index == selectedCategory
                              ? FontWeight.w500
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
