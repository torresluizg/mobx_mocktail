import 'package:dartz/dartz.dart';
import 'package:getx_mockitail/app/shared/client/http_client_interface.dart';
import 'package:getx_mockitail/app/shared/models/superhero_powerstats_model.dart';
import 'package:getx_mockitail/app/shared/repositories/superhero_repository/superhero_repository_interface.dart';

class SuperHeroDetailRepository implements ISuperHeroRepository {
  final IHttpClient _client;

  SuperHeroDetailRepository(this._client);

  @override
  Future<Either<String, dynamic>> getDataFromApi(String route,
      {Map data = const {}}) async {
    Either<String, dynamic> _response = await _client.clientGET(route);
    return _response.fold(
      (l) {
        return left(l);
      },
      (r) {
        final SuperHeroPowerstats _temp = SuperHeroPowerstats.fromMap(r);
        return right(_temp);
      },
    );
  }
}
