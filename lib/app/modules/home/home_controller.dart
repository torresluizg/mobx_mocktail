import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:getx_mockitail/app/shared/models/superhero_base_model.dart';
import 'package:getx_mockitail/app/shared/repositories/superhero_repository/superhero_repository_interface.dart';

class HomeController extends GetxController {
  final ISuperHeroRepository _repository;

  HomeController(this._repository);

  List<SuperHeroBaseModel> baseList = <SuperHeroBaseModel>[];
  var errorMessage = 'jonas';

  Future<void> setControllerAttributes() async {
    _cleanControllerData();
    await _fetchDataFromApi();
    update(['ListView.separated']);
  }

  void _cleanControllerData() {
    baseList = [];
    errorMessage = "";
  }

  Future<void> _fetchDataFromApi() async {
    Either<String, dynamic> _repositoryResponse = await _repository
        .getDataFromApi('https://akabab.github.io/superhero-api/api/all.json');
    _repositoryResponse.fold(
      (l) {
        errorMessage = l;
      },
      (r) {
        baseList = r;
      },
    );
  }
}
