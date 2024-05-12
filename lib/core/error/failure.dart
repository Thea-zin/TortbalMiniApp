import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final dynamic statusCode;

  const Failure({
    required this.message,
    required this.statusCode,
  });

  String get errorMessage => "code: $statusCode Error: $message";

  @override
  List<Object?> get props => [message, statusCode];
}

class SeverFailure extends Failure {
  const SeverFailure({
    required super.message,
    required super.statusCode,
  });
}
