import 'package:equatable/equatable.dart';

class Services extends Equatable {
  final String serviceName;
  final String serviceId;

  const Services({
    required this.serviceName,
    required this.serviceId,
  });

  @override
  List<Object> get props => [serviceName, serviceId];
}