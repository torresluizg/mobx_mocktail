import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:getx_mockitail/app/shared/client/http_client_interface.dart';

class DioClient implements IHttpClient {
  @override
  Future<Either<String, dynamic>> clientGET(String route,
      {Map data = const {}}) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(route);
      return right(response.data);
    } catch (e) {
      return left('Api request error');
    }
  }
}
