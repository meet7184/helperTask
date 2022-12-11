import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_task/ui/homeTab/submit_form_screen.dart';
import 'package:helper_task/ui/model/category_deteils_model.dart';

class CommonGridView extends StatelessWidget {
  final CategoryList categoryList;
  final int index;
  const CommonGridView(
      {Key? key, required this.categoryList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(SubmitFormScreen.routeName,
            arguments:
                SubmitFormArgs(categoryList: categoryList, index: index));
      },
      child: Card(
        elevation: 5,
        color: Colors.deepPurple,
        margin: const EdgeInsets.all(7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade100,
              backgroundImage: NetworkImage(categoryList.imageName),
            ),
            const SizedBox(height: 7),
            title(categoryList.name),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                children: [
                  const Text(
                    "Con:",
                    style: TextStyle(color: Colors.white30, fontSize: 17),
                  ),
                  const SizedBox(width: 3),
                  title(categoryList.conveyance, 16),
                  const Spacer(),
                  title("₹"),
                  const SizedBox(width: 5),
                  title(categoryList.price, 16),
                ],
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget title(String text, [double? fontSize]) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize ?? 18,
          fontWeight: FontWeight.w500,
          color: Colors.white),
    );
  }
}
