import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mehna_tech/core/error/failure.dart';

abstract class BaseUseCase<T,Parameters>
{
  Future<Either<Failure,T>> call(Parameters parameters);
}

class ContextParameters extends Equatable{

  final BuildContext context;
  const ContextParameters({
   required this.context
});
  @override
  List<Object?> get props =>[context];

}