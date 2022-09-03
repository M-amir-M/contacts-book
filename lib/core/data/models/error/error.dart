import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum ErrorType {
  message,
  retry,
}

enum MessageType {
  response,
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  cancelRequest,
  internetProblem,
  unknown,
}

class AppError {
  AppError({
    this.message = "خطای رخ داد",
    this.type = ErrorType.message,
    this.field,
    this.stack,
    this.messageType = MessageType.unknown,
  });

  final String message;
  final String? field;
  final ErrorType? type;
  final StackTrace? stack;
  final MessageType? messageType;

  AppError copyWith({
    String? message,
    String? filed,
    ErrorType? type,
    StackTrace? stack,
    MessageType? messageType,
  }) =>
      AppError(
        message: message ?? this.message,
        field: filed ?? this.field,
        type: type ?? this.type,
        stack: stack ?? this.stack,
        messageType: messageType ?? this.messageType,
      );

  factory AppError.fromRawJson(String str) =>
      AppError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppError.fromJson(Map<String, dynamic> json) => AppError(
        message: json["message"] == null ? "خطای رخ داد" : json["message"],
        field: json["field"] == null ? null : json["field"],
        messageType: MessageType.response,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "field": field == null ? null : field,
      };

  String? messageRelatedWithType(BuildContext context) {
    switch (messageType) {
      case MessageType.response:
        return message;
      case MessageType.connectionTimeout:
        return '';
      case MessageType.sendTimeout:
        return '';
      case MessageType.receiveTimeout:
        return '';
      case MessageType.cancelRequest:
        return '';
      case MessageType.internetProblem:
        return '';
      case MessageType.unknown:
      default:
        return '';
    }
  }

  static MessageType parseMessageType({@required dynamic exception}) {
    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.connectTimeout:
          return MessageType.connectionTimeout;
        case DioErrorType.sendTimeout:
          return MessageType.sendTimeout;
        case DioErrorType.receiveTimeout:
          return MessageType.receiveTimeout;
        case DioErrorType.response:
          return MessageType.response;
        case DioErrorType.cancel:
          return MessageType.cancelRequest;
        case DioErrorType.other:
          return MessageType.internetProblem;
        default:
          return MessageType.unknown;
      }
    }
    return MessageType.unknown;
  }

  @override
  String toString() {
    return 'AppError{message: $message, field: $field, type: $type, stack: $stack, messageType: $messageType}';
  }
}
