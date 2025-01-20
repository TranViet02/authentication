import 'package:authendication_app/home/home_page.dart';
import 'package:authendication_app/login/login_page.dart';
import 'package:authendication_app/register/register_page.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login', initial: true),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
        AutoRoute(page: HomeRoute.page,path: '/home',),
      ];
}
