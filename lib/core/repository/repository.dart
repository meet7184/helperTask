import '../../ui/model/category_deteils_model.dart';

abstract class GetRepository {
  Future<CategoryDetailsModel> getCategory();
}
