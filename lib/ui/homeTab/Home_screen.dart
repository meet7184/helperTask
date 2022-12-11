import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/grid_view_common_widget.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.dehaze_rounded),
      ),
      body: GetBuilder(
        builder: (HomeController controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return GetBuilder(
            builder: (HomeController controller) => GridView.builder(
              itemCount: controller.list.length,
              padding: const EdgeInsets.all(3).copyWith(top: 7),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return CommonGridView(
                    categoryList: controller.list[index], index: index);
              },
            ),
          );
        },
      ),
    );
  }
}
