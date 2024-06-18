import 'package:equatable/equatable.dart';
import 'package:mehna_tech/home/domain/entities/post.dart';

class WorkshopProfile extends Equatable{

  final int workshopId;
  final String name;
  final String picture;
  final String phoneNumber;
  final String workshopType;
  final String followers;
  final String description;
  final bool isFollowed;
  final List<Post> workshopPosts;

  const WorkshopProfile({
    required this.workshopId,
    required this.name,
    required this.picture,
    required this.phoneNumber,
    required this.workshopType,
    required this.followers,
    required this.description,
    required this.isFollowed,
    required this.workshopPosts,
  });

  @override
  List<Object> get props =>[
    workshopId,
    name,
    picture,
    phoneNumber,
    workshopType,
    followers,
    description,
    isFollowed,
    workshopPosts,
  ];
}