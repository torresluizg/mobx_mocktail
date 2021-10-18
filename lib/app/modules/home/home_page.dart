import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mockitail/app/modules/home/home_controller.dart';
import 'package:getx_mockitail/app/modules/home/repository/home_repository.dart';
import 'package:getx_mockitail/app/shared/client/dio_client.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _controller = Get.put(
    HomeController(
      HomeRepository(Get.find<DioClient>()),
    ),
  );
  @override
  Widget build(BuildContext context) {
    _controller.setControllerAttributes();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GetBuilder<HomeController>(
                    id: 'ListView.separated',
                    builder: (state) {
                      return ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.baseList.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/details/$index');
                            },
                            child: Container(
                              width: 160,
                              height: Get.height,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    state.baseList[index].images.xs,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, index) {
                          return const SizedBox(width: 10);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text('Click on any super hero to see its details'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
