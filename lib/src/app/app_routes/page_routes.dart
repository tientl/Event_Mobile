import 'package:event_app/src/presentation/admin_find_page/admin_find_binding.dart';
import 'package:event_app/src/presentation/admin_find_page/admin_find_page.dart';
import 'package:event_app/src/presentation/admin_list_user/admin_list_user_binding.dart';
import 'package:event_app/src/presentation/admin_list_user/admin_list_user_page.dart';
import 'package:event_app/src/presentation/admin_root_app/admin_root_app.dart';
import 'package:event_app/src/presentation/admin_root_app/admin_root_binding.dart';
import 'package:event_app/src/presentation/choice_event_page/choice_event_binding.dart';
import 'package:event_app/src/presentation/choice_event_page/choice_event_page.dart';
import 'package:event_app/src/presentation/home_page/home_binding.dart';
import 'package:event_app/src/presentation/list_sponsor_page/list_ponsor_binding.dart';
import 'package:event_app/src/presentation/list_sponsor_page/list_sponsor_page.dart';
import 'package:event_app/src/presentation/list_user_page/list_user_binding.dart';
import 'package:event_app/src/presentation/list_user_page/list_user_page.dart';
import 'package:event_app/src/presentation/login_page/login_binding.dart';
import 'package:event_app/src/presentation/presentation_detail_page/presentation_detail_binding.dart';
import 'package:event_app/src/presentation/presentation_detail_page/presentation_detail_page.dart';
import 'package:event_app/src/presentation/preview_img/preview_img_binding.dart';
import 'package:event_app/src/presentation/preview_img/preview_img_page.dart';
import 'package:event_app/src/presentation/root_app/root_app_binding.dart';
import 'package:event_app/src/presentation/root_app/root_app_page.dart';
import 'package:event_app/src/presentation/schedule_item_page/schedule_item_binding.dart';
import 'package:event_app/src/presentation/schedule_page/schedule_page.dart';
import 'package:event_app/src/presentation/sub_schedule_page/sub_schedule_binding.dart';
import 'package:event_app/src/presentation/sub_schedule_page/sub_schedule_page.dart';
import 'package:event_app/src/presentation/success_page/success_binding.dart';
import 'package:event_app/src/presentation/success_page/success_page.dart';
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
    GetPage(
        name: AppRoutes.rootApp,
        page: () => const RootApp(),
        binding: RootAppBinding()),
    GetPage(
        name: AppRoutes.listSponsor,
        page: () => const ListSponsorPage(),
        binding: ListSponsorBinding()),
    GetPage(
        name: AppRoutes.listUser,
        page: () => const ListUserPage(),
        binding: ListUserBinding()),
    GetPage(
        name: AppRoutes.scheduleItem,
        page: () => const SchedulePage(),
        binding: ScheduleItemBinding()),
    GetPage(
        name: AppRoutes.subSchedule,
        page: () => const SubSchedulePage(),
        binding: SubScheduleBinding()),
    GetPage(
        name: AppRoutes.presentationDetail,
        page: () => const PresentationDetailPage(),
        binding: PresentationDetailBinding()),
    GetPage(
        name: AppRoutes.previewImg,
        page: () => const PreviewImagePage(),
        binding: PreviewImgBinding()),
    GetPage(
        name: AppRoutes.choiceEvent,
        page: () => const ChoiceEventPage(),
        binding: ChoiceEventBinding()),
    GetPage(
        name: AppRoutes.adminRootApp,
        page: () => const AdminRootApp(),
        binding: AdminRootAppBinding()),
    GetPage(
        name: AppRoutes.success,
        page: () => const SuccessPage(),
        binding: SuccessBinding()),
    GetPage(
        name: AppRoutes.adminSearch,
        page: () => const AdminFindPage(),
        binding: AdminFindBinding()),
    GetPage(
        name: AppRoutes.adminListUser,
        page: () => const AdminListUserPage(),
        binding: AdminListUserBinding())
  ];
}
