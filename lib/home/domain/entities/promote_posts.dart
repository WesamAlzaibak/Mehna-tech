import 'package:equatable/equatable.dart';

class PromotePosts extends Equatable{
  final int id;
  final String image;

  const PromotePosts({
    required this.id,
    required this.image,
  });

  @override
  List<Object> get props =>[
    id,
    image,
  ];

///the extend here for if the data that arrive is equal with everything then the method override will do it novelty
}