
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final dynamic totalCount;
  final String? errorMessage;
  final DioException? error;

  const DataState({this.data, this.totalCount, this.errorMessage, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data, String errorMessage, dynamic totalCount)
      : super(data: data, errorMessage: errorMessage, totalCount: totalCount);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

DataState<T> processApiResponse<T>(
    httpResponse, Function(Map<String, dynamic>) createEntity) {
  final String? errorCode = httpResponse.data.errorCode;
  final returnedData = httpResponse.data.returnedData;
  final errorMessage = httpResponse.data.errorMessage;
  final totalCount = httpResponse.data.totalCount ??
      httpResponse.data.returnedData["TotalCount"];


  if (errorCode == "1") {
    final entity = returnedData == "" ? "" : createEntity(returnedData);
    return DataSuccess(entity, errorMessage, totalCount);
  } else {
    return DataFailed(DioException(
      error: httpResponse.response.statusMessage,
      response: httpResponse.response,
      type: DioExceptionType.badResponse,
      requestOptions: httpResponse.response.requestOptions,
    ));
  }
}

DataState<T> handleDioException<T>(DioException e) {
  return DataFailed(e);
}
