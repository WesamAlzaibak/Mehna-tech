import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String cityId;
  final String cityName;

  const City({
    required this.cityId,
    required this.cityName,
  });

  @override
  List<Object> get props => [cityId, cityName];
}