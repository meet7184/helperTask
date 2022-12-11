import 'dart:async';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:helper_task/ui/model/category_deteils_model.dart';
import '../../../core/repository/repository.dart';

class CategoryUpdateData {
  final int index;
  final String updatedName;

  CategoryUpdateData({required this.index, required this.updatedName});
}

class HomeController extends GetxController {
  late StreamSubscription _streamSubscription;
  final recipeRepo = GetIt.I.get<GetRepository>();
  List<CategoryList> list = [];
  bool isLoading = false;

  final StreamController<CategoryUpdateData> _categoryListen =
      StreamController.broadcast();

  void addEvent(CategoryUpdateData categoryUpdateData) {
    _categoryListen.add(categoryUpdateData);
  }

  Stream<CategoryUpdateData> get categoryListen => _categoryListen.stream;

  Future<void> getCategoryList() async {
    try {
      isLoading = true;
      final response = await recipeRepo.getCategory();
      list = response.categoryList;
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    _streamSubscription = _categoryListen.stream.listen((event) {
      list[event.index].name = event.updatedName;
      update();
      // for (var element in list) {
      //   if (element.id == event.i) {
      //     element.name = event.updatedName;
      //     update();
      //   }
      // }
    });
    getCategoryList();
    super.onInit();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
