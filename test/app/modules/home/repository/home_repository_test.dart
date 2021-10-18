import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_mockitail/app/modules/home/repository/home_repository.dart';
import 'package:getx_mockitail/app/shared/client/dio_client.dart';
import 'package:getx_mockitail/app/shared/models/superhero_base_model.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements DioClient {
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

void main() async {
  final ClientMock dioMock = ClientMock();
  final _repository = HomeRepository(dioMock);
  var repositoryResponse = await _repository.getDataFromApi(
    'https://akabab.github.io/superhero-api/api/all.json',
  );
  group('Without use Mock:', () {
    test('Success is a Right', () async {
      expect(repositoryResponse, isA<Right>());
    });
    test('Right is a List of SuperHeroBaseModel', () {
      repositoryResponse.foldRight(repositoryResponse, (r, previous) {
        expect(r, isA<List<SuperHeroBaseModel>>());
      });
    });
  });

  group('Using Mock:', () {
    test('Trying the Mock class', () async {
      when(() => dioMock.clientGET("")).thenAnswer((_) async => const Left(""));
      repositoryResponse = await _repository.getDataFromApi(
        'https://akabab.github.io/superhero-api/api/all.json',
      );
      repositoryResponse.foldLeft(repositoryResponse, (previous, r) {
        expect(r, equals(""));
      });
    });
  }, skip: 'Skipping for no reason');
}
