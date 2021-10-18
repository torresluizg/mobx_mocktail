// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mockitail/app/modules/home/home_page.dart';
import 'package:getx_mockitail/app/modules/super_hero_detail/super_hero_detail_page.dart';
import 'package:getx_mockitail/app/shared/client/dio_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _dio = Get.put(DioClient());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Super Heroes',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/details/:id',
          page: () => SuperHeroDetailPage(index: Get.parameters['id'] ?? '0'),
          transition: Transition.native,
        ),
      ],
      initialRoute: '/home',
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
