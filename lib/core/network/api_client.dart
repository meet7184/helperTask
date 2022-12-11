import '../../ui/model/category_deteils_model.dart';

abstract class ApiClient {
  Future<CategoryDetailsModel> getCategory();
}
