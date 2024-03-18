

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final String code;
  const Failure({this.message = "Unable to process service at this time", this.code = ""});
  @override
  List<Object> get props => [message, code];
  String getErrorMessage(){
    return message;
  }
}

class LocalDatasourceFailure extends Failure {}
class ServiceFailure extends Failure {}