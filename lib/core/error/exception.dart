import 'package:mehna_tech/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorModel errorModel;
  const ServerException({
    required this.errorModel
  });
}

class LocalDataBaseException implements Exception{
  final String errorMessage;
  const LocalDataBaseException({
    required this.errorMessage
  });
}