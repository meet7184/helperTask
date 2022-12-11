import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_task/ui/homeTab/controller/home_controller.dart';

Future<void> showCategoryBottomSheet(
    List<CategoryUpdateData> allCategory) async {
  await Get.bottomSheet(
    CategoryBottomSheetView(categories: allCategory),
    backgroundColor: Colors.white,
    isScrollControlled: true,
  );
}

class CategoryBottomSheetView extends StatelessWidget {
  final List<CategoryUpdateData> categories;
  HomeController get homeController => Get.find<HomeController>();

  const CategoryBottomSheetView({super.key, required this.categories});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Select Job Category",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: Colors.red),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: categories
                      .map((e) => GestureDetector(
                            onTap: () {
                              homeController.addEvent(e);
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.updatedName,
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  const Divider(
                                    thickness: 1.5,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList()),
            ),
          )
        ],
      ),
    );
  }
}
