import '../../models/models.dart';

abstract class BaseDatabaseRepository {
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Stream<UserModel> getUser(String userId);
  Future<void> updateUserPictures(UserModel user, String image);

  Stream<List<CategoryModel>> getFoodCategories();
  Stream<List<RestaurantModel>> getRestaurants(String? tag);
}
