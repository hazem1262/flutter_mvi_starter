import 'package:flutter_mvi_starter/utils/network/application_error.dart';

class ApiResponse {
  dynamic data;
  late Status status;
  ApplicationError? error;

  ApiResponse.success(this.data) {
    status = Status.OK;
  }

  ApiResponse.failed(ApplicationError error) {
    this.error = error;
    status = Status.FAILED;
  }
}

enum Status {
  OK, FAILED
}