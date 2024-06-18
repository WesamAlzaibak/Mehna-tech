import 'package:mehna_tech/auth/domain/entities/No_Entities.dart';

class NoEntitiesModel extends NoEntities {
  const NoEntitiesModel({
    required super.status,
  });

  factory NoEntitiesModel.fromJson(Map<String, dynamic> json) => NoEntitiesModel(
    status: json["status"],
  );
}
