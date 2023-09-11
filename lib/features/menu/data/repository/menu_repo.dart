import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache_helper/cache_helper.dart';
import 'package:chef_app/core/errors/exceptions.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class MenuRepository {
  Future<Either<String, String>> addMealToMenu({
    required XFile image,
    required String mealName,
    required String mealDesc,
    required double mealPrice,
    required String mealCategory,
    required String howToSeal,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.addMeal, data: {
        ApiKeys.name: mealName,
        ApiKeys.price: mealPrice,
        ApiKeys.description: mealDesc,
        ApiKeys.category: mealCategory,
        ApiKeys.howToSell: howToSeal,
        ApiKeys.mealImages: await uploadImages(image),
      });
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteMealById({
    required String mealId,
  }) async {
    try {
      final response = await sl<ApiConsumer>().delete(
        EndPoint.getDeleteMealEndPoint(mealId),
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, GetAllMealsModel>> getMeals() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getAllChefMeals(
          sl<CacheHelper>().getData(
            key: ApiKeys.chefId,
          ),
        ),
      );
      return Right(
        GetAllMealsModel.fromJson(response),
      );
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
