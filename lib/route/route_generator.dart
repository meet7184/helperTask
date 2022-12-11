import 'package:get/get.dart';
import '../ui/homeTab/Home_screen.dart';
import '../ui/homeTab/submit_form_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  GetPage(name: SubmitFormScreen.routeName, page: () => const SubmitFormScreen()),
];
