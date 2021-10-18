import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mockitail/app/modules/home/home_controller.dart';
import 'package:getx_mockitail/app/shared/models/superhero_base_model.dart';
import 'package:getx_mockitail/app/shared/models/superhero_powerstats_model.dart';
import 'package:getx_mockitail/app/shared/repositories/superhero_repository/superhero_repository_interface.dart';

class SuperHeroDetailController extends GetxController {
  SuperHeroPowerstats? powerstats;
  SuperHeroBaseModel? superhero;
  String errorMessage = '';

  final ISuperHeroRepository repository;

  SuperHeroDetailController(this.repository);

  void getSuperHero(String index) {
    if (superhero != null) return;
    var _homeControllerInstance = Get.find<HomeController>();
    superhero = _homeControllerInstance.baseList[int.parse(index)];
  }

  Future<void> fetchData() async {
    Either<String, dynamic> _repositoryResponse = await repository.getDataFromApi(
        'https://akabab.github.io/superhero-api/api/powerstats/${superhero!.id}.json');
    _repositoryResponse.fold(
      (l) {
        errorMessage = l;
      },
      (r) {
        powerstats = r;
      },
    );
    update(['powerstats']);
  }
}
