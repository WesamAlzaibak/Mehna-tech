import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String placeId;
  final String placeName;

  const Place({
    required this.placeId,
    required this.placeName,
  });

  @override
  List<Object> get props => [placeId, placeName];
}