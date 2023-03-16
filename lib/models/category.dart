import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String? name;
  final String? image;

  Category({
    this.name,
    this.image,
  });

  factory Category.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Category(
      name: data?['name'],
      image: data?['image'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (image != null) "image": image,
    };
  }
}
