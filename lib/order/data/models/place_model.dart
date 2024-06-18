import 'package:mehna_tech/order/domain/entities/Place.dart';

class PlaceModel extends Place {

  const PlaceModel({
    required super.placeId,
    required super.placeName,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    placeId: json["place_id"],
    placeName: json["place_name"],
  );
}
