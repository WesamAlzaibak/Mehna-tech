import 'package:equatable/equatable.dart';

class Search extends Equatable{

  final int workshopId;
  final String name;
  final String picture;
  final String phoneNumber;
  final String workshopType;
  final bool isFollowed;

  const Search({
    required this.workshopId,
    required this.name,
    required this.picture,
    required this.phoneNumber,
    required this.workshopType,
    required this.isFollowed,
  });

  @override
  List<Object> get props =>[
    workshopId,
    name,
    picture,
    phoneNumber,
    workshopType,
    isFollowed
  ];
}