import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_task/ui/widget/common_text_field.dart';
import '../../core/bindings/app_function.dart';
import '../model/category_deteils_model.dart';
import '../widget/category_bottom_sheet.dart';
import 'controller/home_controller.dart';

class SubmitFormArgs {
  final CategoryList categoryList;
  final int index;

  SubmitFormArgs({required this.categoryList, required this.index});
}

class SubmitFormScreen extends StatefulWidget {
  static String routeName = '/submitFormScreen';
  const SubmitFormScreen({Key? key}) : super(key: key);

  @override
  State<SubmitFormScreen> createState() => _SubmitFormScreenState();
}

class _SubmitFormScreenState extends State<SubmitFormScreen> {
  late SubmitFormArgs submitFormArgs;

  HomeController get homeController => Get.find<HomeController>();

  CategoryList get categoryList => submitFormArgs.categoryList;

  late StreamSubscription streamSubscription;
  @override
  void initState() {
    submitFormArgs = Get.arguments as SubmitFormArgs;
    streamSubscription = homeController.categoryListen.listen((event) {
      if (event.index == submitFormArgs.index) {
        categoryList.name = event.updatedName;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          iconSize: 25,
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            disposeKeyboard();
            Get.back();
          },
        ),
      ),
      body: GetBuilder(
        builder: (HomeController controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showCategoryBottomSheet(controller.list
                      .map((e) => CategoryUpdateData(
                          index: submitFormArgs.index, updatedName: e.name))
                      .toList());
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        title(categoryList.name),
                        //title(widget.categoryList.name),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                textFieldType: TextFieldType.labourCount,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                textFieldType: TextFieldType.address,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.location_on_sharp, size: 25),
                  Column(
                    children: [
                      const Text(
                        "Get Current Location",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Container(
                        height: 1,
                        width: 146,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Text(
                    "Start Time",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: CustomTextField(
                      textFieldType: TextFieldType.selectTime,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 5),
                  Expanded(
                    child: CustomTextField(
                      textFieldType: TextFieldType.startDate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 5),
                  Expanded(
                    child: CustomTextField(
                      textFieldType: TextFieldType.endDate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Text(
                    "Shift",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: CustomTextField(
                      textFieldType: TextFieldType.selectShift,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Upload Site Image",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.upload_sharp, size: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black38),
    );
  }
}
