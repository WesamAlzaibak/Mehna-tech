import 'package:equatable/equatable.dart';

class NoEntities extends Equatable{
  final String status;

  const NoEntities({
    required this.status,
  });

  @override
  List<Object> get props =>[
    status,
  ];
}