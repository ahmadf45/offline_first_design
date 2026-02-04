import 'package:flutter/material.dart';
import 'package:offline_first_design/ui/pages/home/home_view.dart';

import 'pages.dart';

/// To create router for every single page
class Router {
  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  late RouteObserver<PageRoute> routeObserver;

  Route<dynamic>? getRoute(RouteSettings? settings) {
    switch (settings?.name) {
      case Pages.home:
        return _buildRoute(settings, const HomeView());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings? settings, Widget builder) {
    return MaterialPageRoute(settings: settings, builder: (ctx) => builder);
  }
}
