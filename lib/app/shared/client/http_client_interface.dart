import 'package:dartz/dartz.dart';

abstract class IHttpClient {
  Future<Either<String, dynamic>> clientGET(String route,
      {Map data = const {}});
}
