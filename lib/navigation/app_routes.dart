import 'package:flutter_buried_dot/ui/home/home_binding.dart';
import 'package:flutter_buried_dot/ui/home/home_view.dart';
import 'package:flutter_buried_dot/ui/message/message_binding.dart';
import 'package:flutter_buried_dot/ui/message/message_view.dart';
import 'package:flutter_buried_dot/ui/profile/profile_binding.dart';
import 'package:flutter_buried_dot/ui/profile/profile_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const String home = "/home";
  static const String profile = "/profile";
  static const String message = "/message";

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeWidget(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileWidget(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.message,
      page: () => const MessageWidget(),
      binding: MessageBinding(),
    )
  ];
}
