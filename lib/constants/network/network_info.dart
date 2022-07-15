//Abstract here so we can use different packages in the future
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetowrkInfoImp implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  NetowrkInfoImp({required this.connectionChecker});
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
