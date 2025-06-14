
import 'package:equatable/equatable.dart';

class BaseResponseModel<T> {
  final String? errorCode;
  final String? errorMessage;
  final dynamic totalCount;
  final T? returnedData;
  final String? subscriptionExpired;
  final String? subscriptionMessage;
  final String? connectionType;
  final String? downloadLink;

  const BaseResponseModel({
    this.errorCode,
    this.errorMessage,
    this.totalCount,
    this.returnedData,
    this.subscriptionExpired,
    this.subscriptionMessage,
    this.connectionType,
    this.downloadLink,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> map) {
    return BaseResponseModel(
      errorCode: map['ErrorCode'] ?? "",
      errorMessage: map['ErrorMessage'] ?? "",
      returnedData: map['ReturnedData'] ?? {},
      totalCount: map['TotalCount'],
      subscriptionExpired: map['SubscriptionExpired'] ?? "",
      subscriptionMessage: map['SubscriptionMessage'] ?? "",
      connectionType: map['ConnectionType'] ?? "",
      downloadLink: map['Link'] ?? "",
    );
  }
}

class BaseHelpResponseModel extends BaseHelpResponseEntity {
  const BaseHelpResponseModel({
    super.errorCode,
    super.errorMessage,
    super.subscriptionExpired,
    super.connectionType,
  });

  factory BaseHelpResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseHelpResponseModel(
      errorCode: json['ErrorCode'] ?? '0',
      errorMessage: json['ErrorMessage'] ?? '0',
      subscriptionExpired: json['SubscriptionExpired'] ?? '0',
      connectionType: json['ConnectionType'] ?? '0',
    );
  }
}

class BaseHelpResponseEntity extends Equatable {
  final String? errorCode;
  final String? errorMessage;
  final String? subscriptionExpired;
  final String? connectionType;

  const BaseHelpResponseEntity({
    this.errorCode,
    this.errorMessage,
    this.subscriptionExpired,
    this.connectionType,
  });

  @override
  List<Object?> get props => [
        errorCode,
        errorMessage,
        subscriptionExpired,
        connectionType,
      ];

  Map<String, dynamic> toJson() {
    return {
      'ErrorMessage': errorMessage,
      'ErrorCode': errorCode,
      'SubscriptionExpired': subscriptionExpired,
      'ConnectionType': connectionType,
    };
  }
}
