import 'package:dartz/dartz.dart';
import 'package:mehna_tech/core/error/failure.dart';
import 'package:mehna_tech/home/domain/entities/category.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/home/domain/entities/promote_posts.dart';

abstract class BaseHomeRepository{
  Future <Either<Failure,List<Post>>> getHomePosts();

  Future <Either<Failure,List<PromotePosts>>> getPromotePosts();

  Future <Either<Failure,List<Categories>>> getCategories();

}