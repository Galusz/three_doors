// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/result_page.dart' as _i3;
import '../pages/splash_page.dart' as _i1;
import '../pages/three_doors_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    ThreeDoorsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.ThreeDoorsPage());
    },
    ResultRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ResultPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/'),
        _i4.RouteConfig(ThreeDoorsRoute.name, path: '/main'),
        _i4.RouteConfig(ResultRoute.name, path: '/result')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.ThreeDoorsPage]
class ThreeDoorsRoute extends _i4.PageRouteInfo<void> {
  const ThreeDoorsRoute() : super(ThreeDoorsRoute.name, path: '/main');

  static const String name = 'ThreeDoorsRoute';
}

/// generated route for
/// [_i3.ResultPage]
class ResultRoute extends _i4.PageRouteInfo<void> {
  const ResultRoute() : super(ResultRoute.name, path: '/result');

  static const String name = 'ResultRoute';
}
