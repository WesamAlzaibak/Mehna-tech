import 'package:mehna_tech/search/domain/entities/Search.dart';

class SearchModel extends Search {
  const SearchModel({
    required super.workshopId,
    required super.picture,
    required super.name,
    required super.phoneNumber,
    required super.workshopType,
    required super.isFollowed,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    workshopId: json["workshop_id"],
    picture: json["picture"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    workshopType: json["workshop_type"],
    isFollowed: json["isFollowed"],
  );
}
