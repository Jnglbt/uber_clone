import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String fName;
  final String lName;
  final String phone;
  final String image;
  final String email;

  const UserModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
  });

  @override
  List<Object?> get props => [id, fName, lName, phone, image];

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      fName: snap['fName'],
      lName: snap['lName'],
      phone: snap['phone'],
      image: snap['image'],
      email: snap['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fName': fName,
      'lName': lName,
      'phone': phone,
      'image': image,
      'email': email,
    };
  }

  UserModel copyWith({
    String? id,
    String? fName,
    String? lName,
    String? phone,
    String? image,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      email: email ?? this.email,
    );
  }
}
