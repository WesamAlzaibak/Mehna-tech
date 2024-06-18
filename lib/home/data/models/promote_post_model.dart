import 'package:mehna_tech/home/domain/entities/promote_posts.dart';

class PromotePostModel extends PromotePosts{

  const PromotePostModel({
    required super.id,
    required super.image,
  });

  factory PromotePostModel.fromJson(Map<String,dynamic> json)=>PromotePostModel(
    id: json["id"],
    image: json["image"],
  );

}