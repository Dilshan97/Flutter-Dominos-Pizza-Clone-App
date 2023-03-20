import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  final String? name;
  final String? desc;
  final String? image;
  final String? category;
  final List<Map<String, dynamic>>? sizes;

  Food({
    this.name,
    this.desc,
    this.image,
    this.category,
    this.sizes,
  });

  factory Food.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Food(
      name: data?['name'],
      desc: data?['desc'],
      image: data?['image'],
      category: data?['category'],
      sizes: data?['sizes'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (desc != null) "desc": desc,
      if (image != null) "image": image,
      if (category != null) "category": category,
      if (sizes != null) "sizes": sizes,
    };
  }
}
