import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String errorCode;

  const Failure(this.message, this.errorCode);

  @override
  List<Object> get props => [message, errorCode];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, super.errorCode);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with api server', "");
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with ApiServer', "");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with ApiServer', "");
      case DioExceptionType.badCertificate:
        return const ServerFailure('badCertificate with api server', "");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure('Request to ApiServer was canceld', "");
      case DioExceptionType.connectionError:
        return const ServerFailure('No Internet Connection', "");
      case DioExceptionType.unknown:
        return const ServerFailure(
            'Ops, There was an Error, Please try again', "");
    }
  }

  factory ServerFailure.fromResponse(dynamic response) {
    if (response['ErrorMessage'] != null) {
      return ServerFailure(response['ErrorMessage'], response['ErrorCode'].toString());
    } else {
      return const ServerFailure('There was an error , please try again', "");
    }
  }

  @override
  String toString() {
    return 'ServerFailure{errorMessage: $message}';
  }
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message, super.errorCode);

  @override
  String toString() {
    return 'ConnectionFailure{errorMessage: $message}';
  }
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message, super.errorCode);
}

class PlaybackFailure extends Failure {
  const PlaybackFailure(super.message, super.errorCode);
}