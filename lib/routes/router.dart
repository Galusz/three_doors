import 'package:auto_route/annotations.dart';
import 'package:three_doors/pages/splash_page.dart';
import 'package:three_doors/pages/welcome_screen.dart';
import 'package:three_doors/pages/result_page.dart';
import 'package:three_doors/pages/three_doors_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: ThreeDoorsPage, path: '/main'),
    AutoRoute(page: ResultPage, path: '/result'),
  ],
)
class $AppRouter {}
