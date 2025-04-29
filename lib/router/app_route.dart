// app_router.dart
import 'package:auto_route/auto_route.dart';
import 'package:sippy/views/cart_screen/cart_screen.dart';
import 'package:sippy/views/cart_screen/shared_cart_screen.dart';
import 'package:sippy/views/homescreen/home_screen.dart';
import 'package:sippy/views/invite_screen/invite_screen.dart';
import 'package:sippy/views/product_screen/product_screen.dart';

part 'app_route.gr.dart'; // This will be generated!

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: InviteRoute.page),
        AutoRoute(page: ProductRoute.page),
        AutoRoute(page: SharedCartRoute.page),
      ];
}
