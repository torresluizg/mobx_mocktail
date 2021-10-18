import 'package:dartz/dartz.dart';
import 'package:getx_mockitail/app/shared/client/http_client_interface.dart';
import 'package:getx_mockitail/app/shared/models/superhero_base_model.dart';
import 'package:getx_mockitail/app/shared/repositories/superhero_repository/superhero_repository_interface.dart';

class HomeRepository implements ISuperHeroRepository {
  final IHttpClient _client;

  HomeRepository(this._client);
  @override
  Future<Either<String, dynamic>> getDataFromApi(String route,
      {Map data = const {}}) async {
    Either<String, dynamic> _response = await _client.clientGET(route);
    return _response.fold(
      (l) {
        return left(l);
      },
      (r) {
        try {
          List<SuperHeroBaseModel> _tempList = [];
          r.forEach((json) {
            final SuperHeroBaseModel _temp = SuperHeroBaseModel.fromMap(json);

            _tempList.add(_temp);
          });
          return right(_tempList);
        } catch (e) {
          return left('Parsing error in the Super Hero Base Model');
        }
      },
    );
  }
}
