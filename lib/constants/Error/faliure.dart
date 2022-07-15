// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class FailResponse extends Failure {
  final String failResponse;
  FailResponse(this.failResponse);
  @override
  List<Object?> get props => [failResponse];
}

// ignore: constant_identifier_names
const String SERVER_FAILURE_MESSAGE = 'Please try again later .';
const String OFFLINE_FAILURE_MESSAGE = 'Please Check your Internet Connection';
