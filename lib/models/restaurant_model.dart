import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable {
  final String image;
  final String name;
  final double fee;
  final int minTime;
  final int maxTime;
  final double score;
  final String tag;
  final bool isSponsored;

  const RestaurantModel(
      {required this.fee,
      required this.minTime,
      required this.maxTime,
      required this.score,
      required this.tag,
      required this.isSponsored,
      required this.image,
      required this.name});

  factory RestaurantModel.fromSnapshot(DocumentSnapshot snap) {
    return RestaurantModel(
      image: snap['image'],
      name: snap['name'],
      fee: snap['fee'].toDouble(),
      isSponsored: snap['isSponsored'],
      maxTime: snap['maxTime'],
      minTime: snap['minTime'],
      score: snap['score'].toDouble(),
      tag: snap['tag'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'fee': fee,
      'isSponsored': isSponsored,
      'maxTime': maxTime,
      'minTime': minTime,
      'score': score,
      'tag': tag,
    };
  }

  @override
  List<Object?> get props => [
        image,
        name,
        fee,
        maxTime,
        minTime,
        score,
        isSponsored,
        tag,
      ];
}
