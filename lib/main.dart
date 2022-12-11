import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:helper_task/route/route_generator.dart';
import 'package:helper_task/ui/homeTab/Home_screen.dart';
import 'core/bindings/app_bindings.dart';
import 'core/network/api_client.dart';
import 'core/network/dio/dio_api_client.dart';
import 'core/repository/repository.dart';
import 'core/repository/repository_impl.dart';

void main() async {
  GetIt.I.registerSingletonAsync<ApiClient>(() => DioApiClient.getInstance());
  GetIt.I.registerSingletonWithDependencies<GetRepository>(
    () => GetRepositoryImpl(),
    dependsOn: [ApiClient],
  );
  await GetIt.I.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
