import 'package:equatable/equatable.dart';

class Login extends Equatable{

  final String token;
  final String picture;
  final int id;

  const Login({
    required this.token,
    required this.picture,
    required this.id
  });

  @override
  List<Object> get props =>[
    token,
    picture,
    id,
  ];
}