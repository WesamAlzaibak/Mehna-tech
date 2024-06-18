import 'package:equatable/equatable.dart';

class Categories extends Equatable{
  final int categoryId;
  final String name;
  final String image;

  const Categories({
    required this.categoryId,
    required this.name,
    required this.image,
  });

  @override
  List<Object> get props =>[
    categoryId,
    name,
    image,
  ];

}