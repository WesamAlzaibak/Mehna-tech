import 'package:mehna_tech/home/domain/entities/post.dart';
import 'package:mehna_tech/workshop_profile/domain/entities/WorkshopProfile.dart';

class WorkshopProfileModel extends WorkshopProfile {
  const WorkshopProfileModel({
    required super.workshopId,
    required super.picture,
    required super.name,
    required super.phoneNumber,
    required super.workshopType,
    required super.followers,
    required super.description,
    required super.isFollowed,
    required super.workshopPosts,
  });

  factory WorkshopProfileModel.fromJson(Map<String, dynamic> json) => WorkshopProfileModel(
    workshopId: json["workshop_id"],
    picture: json["picture"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    workshopType: json["workshop_type"],
    followers: json["followers"],
    description: json["description"],
    isFollowed: json["isFollowed"],
    workshopPosts: List<Post>.from(json["workshop_posts"]),
  );
}
