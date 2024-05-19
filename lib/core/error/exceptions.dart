import 'package:equatable/equatable.dart';
import 'package:thortbal/core/error/failure.dart';

class ServerException extends Equatable implements Failure {
  final String message;
  final String statusCode;

  const ServerException({
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];

  @override
  // TODO: implement errorMessage
  String get errorMessage => "code: $statusCode Error: $message";
}
