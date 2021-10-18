import 'package:dartz/dartz.dart';

abstract class ISuperHeroRepository {
  Future<Either<String, dynamic>> getDataFromApi(String route,
      {Map data = const {}});
}
