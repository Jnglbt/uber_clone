import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String image;
  final String name;

  const CategoryModel({required this.image, required this.name});

  factory CategoryModel.fromSnapshot(DocumentSnapshot snap) {
    return CategoryModel(
      image: snap['image'],
      name: snap['name'],
    );
  }

  Map<String, String> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [image, name];
}
