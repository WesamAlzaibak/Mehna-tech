import 'package:dio/dio.dart';
import 'package:mehna_tech/core/error/exception.dart';
import 'package:mehna_tech/core/network/error_message_model.dart';
import 'package:mehna_tech/core/utils/app_constance.dart';
import 'package:mehna_tech/home/data/models/category_model.dart';
import 'package:mehna_tech/home/data/models/post_model.dart';
import 'package:mehna_tech/home/data/models/promote_post_model.dart';

abstract class BaseHomeRemoteDataSource{
  Future<List<PostModel>> getHomePosts();
  Future<List<PromotePostModel>> getPromotePosts();
  Future<List<CategoryModel>> getCategories();
}
class HomeRemoteDataSource extends BaseHomeRemoteDataSource{

  @override
  Future<List<PostModel>> getHomePosts()async{
    final response = await Dio().get(
        AppConstance.homePostsURL,
        options: Options(headers: AppConstance.sendHeaders)
    );
    if(response.statusCode==200) {
      return List<PostModel>.from((response.data["results"] as List).map((e)
      => PostModel.fromJson(e)
      ));
    }
    else{
      throw ServerException(
        errorModel : ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<PromotePostModel>> getPromotePosts() async{
    final response = await Dio().get(
        AppConstance.promotePostsURL,
        options: Options(headers: AppConstance.sendHeaders)
    );
    if(response.statusCode==200) {
      return List<PromotePostModel>.from((response.data["results"] as List).map((e)
      => PromotePostModel.fromJson(e)
      ));
    }
    else{

      throw ServerException(
        errorModel : ErrorModel.fromJson(response.data),
      );
    }

  }

  @override
  Future<List<CategoryModel>> getCategories()async{
    final response = await Dio().get(
        AppConstance.categoriesURL,
        options: Options(headers: AppConstance.sendHeaders)
    );
    if(response.statusCode==200) {
      return List<CategoryModel>.from((response.data["results"] as List).map((e)
      => CategoryModel.fromJson(e)
      ));
    }
    else{

      throw ServerException(
        errorModel : ErrorModel.fromJson(response.data),
      );
    }

  }

}