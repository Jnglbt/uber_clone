import 'package:image_picker/image_picker.dart';

import '../../models/models.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(UserModel user, XFile image);
  Future<String> getDownloadUrl(UserModel user, String imageName);
}
