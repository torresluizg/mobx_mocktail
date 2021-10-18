import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mockitail/app/modules/super_hero_detail/repository/super_hero_detail_repository.dart';
import 'package:getx_mockitail/app/modules/super_hero_detail/super_hero_detail_controller.dart';
import 'package:getx_mockitail/app/shared/client/dio_client.dart';

class SuperHeroDetailPage extends StatelessWidget {
  final String index;
  SuperHeroDetailPage({Key? key, required this.index}) : super(key: key);
  final _controller = Get.put(
    SuperHeroDetailController(
      SuperHeroDetailRepository(Get.find<DioClient>()),
    ),
  );
  @override
  Widget build(BuildContext context) {
    _controller.getSuperHero(index);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail one page'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  minRadius: 75,
                  backgroundImage: NetworkImage(
                    _controller.superhero!.images.xs,
                  ),
                ),
                const SizedBox(width: 10),
                GetBuilder<SuperHeroDetailController>(
                  id: 'superhero_bio',
                  builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Name:'),
                      Text('${_.superhero?.name}'),
                      const SizedBox(height: 10),
                      const Text('Slug:'),
                      Text('${_.superhero?.slug}'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GetBuilder<SuperHeroDetailController>(
              id: 'powerstats',
              builder: (_) {
                if (_.powerstats == null) {
                  return ElevatedButton(
                    onPressed: () => _.fetchData(),
                    child: const Text('Get Powerstats'),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Combat:'),
                    Text('${_.powerstats?.combat}'),
                    const SizedBox(height: 10),
                    const Text('Durability:'),
                    Text('${_.powerstats?.durability}'),
                    const SizedBox(height: 10),
                    const Text('Intelligence:'),
                    Text('${_.powerstats?.intelligence}'),
                    const SizedBox(height: 10),
                    const Text('Power:'),
                    Text('${_.powerstats?.power}'),
                    const SizedBox(height: 10),
                    const Text('Speed:'),
                    Text('${_.powerstats?.speed}'),
                    const SizedBox(height: 10),
                    const Text('Strength:'),
                    Text('${_.powerstats?.strength}'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
