import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../../models/models.dart';
import '../repositories.dart';
import 'base_storage_repository.dart';

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(UserModel user, XFile image) async {
    try {
      await storage
          .ref('${user.id}/${image.name}')
          .putFile(
            File(image.path),
          )
          .then(
            (p0) => DatabaseRepositry().updateUserPictures(user, image.name),
          );
    } catch (_) {}
  }

  @override
  Future<String> getDownloadUrl(UserModel user, String imageName) async {
    String downloadUrl =
        await storage.ref('${user.id}/$imageName').getDownloadURL();

    return downloadUrl;
  }
}
