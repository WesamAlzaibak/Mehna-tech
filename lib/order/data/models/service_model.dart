import 'package:mehna_tech/order/domain/entities/Service.dart';

class ServicesModel extends Services {

  const ServicesModel({
    required super.serviceName,
    required super.serviceId,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
    serviceName: json["service_name"],
    serviceId: json["service_id"],
  );
}