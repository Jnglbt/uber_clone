import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';
import '../repositories.dart';
import 'base_database_repository.dart';

class DatabaseRepositry extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) async {
    await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  @override
  Future<void> updateUser(UserModel user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => print('User document updated.'));
  }

  @override
  Stream<UserModel> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => UserModel.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(UserModel user, String image) async {
    String downloadUrl = await StorageRepository().getDownloadUrl(user, image);

    return _firebaseFirestore.collection('users').doc(user.id).update({
      'image': downloadUrl,
    });
  }

  @override
  Stream<List<CategoryModel>> getFoodCategories() {
    return _firebaseFirestore
        .collection('food_categories')
        .snapshots()
        .map((snap) {
      return snap.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    });
  }

  @override
  Stream<List<RestaurantModel>> getRestaurants(String? tag) {
    return tag == null
        ? _firebaseFirestore
            .collection('restaurants')
            .orderBy('isSponsored', descending: true)
            .snapshots()
            .map((snap) {
            return snap.docs
                .map((doc) => RestaurantModel.fromSnapshot(doc))
                .toList();
          })
        : _firebaseFirestore
            .collection('restaurants')
            .where('tag', isEqualTo: tag)
            // .orderBy('tag', descending: true)
            // .orderBy('isSponsored', descending: true)
            .snapshots()
            .map((snap) {
            return snap.docs
                .map((doc) => RestaurantModel.fromSnapshot(doc))
                .toList();
          });
  }
}
