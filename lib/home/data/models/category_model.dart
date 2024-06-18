import 'package:mehna_tech/home/domain/entities/category.dart';

class CategoryModel extends Categories{

  const CategoryModel({
    required super.categoryId,
    required super.name,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String,dynamic> json)=>CategoryModel(
    categoryId: json["category_id"],
    name: json["name"],
    image: json["image"],
  );

}