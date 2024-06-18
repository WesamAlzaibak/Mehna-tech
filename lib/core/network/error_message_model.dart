import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable{
  final String errorMessage;
  final bool success;
  const ErrorModel({
    required this.errorMessage,
    required this.success,
  });
  factory ErrorModel.fromJson(Map<String,dynamic> json)=>ErrorModel(
    errorMessage: json["message"],
    success: json["success"],
  );
  @override
  List<Object> get props =>
      [
        errorMessage,
        success,
      ];

}