import 'package:get/get.dart';

import '../modules/card_details/bindings/card_details_binding.dart';
import '../modules/card_details/views/card_details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CARD_DETAILS,
      page: () => const CardDetailsView(),
      binding: CardDetailsBinding(),
      transition: Transition.fadeIn, // Add animation transition
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
