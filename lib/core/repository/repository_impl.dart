import 'package:get_it/get_it.dart';
import 'package:helper_task/ui/model/category_deteils_model.dart';
import '../network/api_client.dart';
import 'repository.dart';

class GetRepositoryImpl extends GetRepository {
  final repo = GetIt.I.get<ApiClient>();

  @override
  Future<CategoryDetailsModel> getCategory() async {
    return await repo.getCategory();
  }
}
