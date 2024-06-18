import 'package:mehna_tech/order/domain/entities/City.dart';

class CityModel extends City {

  const CityModel({
    required super.cityId,
    required super.cityName,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    cityId: json["city_id"],
    cityName: json["city_name"],
  );
}
