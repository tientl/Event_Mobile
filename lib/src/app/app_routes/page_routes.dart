import 'package:event_app/src/presentation/home_page/home_binding.dart';
import 'package:event_app/src/presentation/login_page/login_binding.dart';
import 'package:get/get.dart';
import '../../presentation/home_page/home_page.dart';
import '../../presentation/login_page/login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.homePage,
        page: () => const HomePage(),
        binding: HomeBinding()),
  ];
}
