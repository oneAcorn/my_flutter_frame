// import 'package:flutter/material.dart';
//
// import '../../utils/LogUtils.dart';
//
// class HomeRouteDelegate extends RouterDelegate<List<RouteSettings>>
//     with ChangeNotifier, PopNavigatorRouterDelegateMixin {
//   final List<Page> _pages = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       pages: List.of(_pages),
//       onPopPage: _onPopPage,
//     );
//   }
//
//   @override
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   @override
//   List<Page> get currentConfiguration => List.of(_pages);
//
//   @override
//   Future<void> setNewRoutePath(List<RouteSettings> configuration) {
//     _setPath(configuration
//         .map((routeSettings) => _createPage(routeSettings))
//         .toList());
//     return Future.value(null);
//   }
//
//   @override
//   Future<bool> popRoute() {
//     if (canPop()) {
//       _pages.removeLast();
//       notifyListeners();
//       return Future.value(true);
//     }
//     //没有可弹出页面
//     return Future.value(false);
//   }
//
//   void push({required String name, dynamic arguments}) {
//     LogUtils.log("Route Delegate push $name,$arguments");
//     _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
//     notifyListeners();
//   }
//
//   void replace({required String name, dynamic arguments}) {
//     if (_pages.isNotEmpty) {
//       _pages.removeLast();
//     }
//     push(name: name, arguments: arguments);
//   }
//
//   MaterialPage _createPage(RouteSettings routeSettings) {
//     Widget child;
//     LogUtils.log("createPage:${routeSettings.name}");
//     switch (routeSettings.name) {
//       case '/splash':
//         child = const SplashPage();
//         break;
//       case '/home':
//         child = const HomePage();
//         break;
//       case '/login':
//         child = const LoginPage();
//         break;
//     // case '/details':
//     //   child = Details(routeSettings.arguments! as Map<String, String>);
//     //   break;
//       default:
//         child = const Scaffold();
//     }
//
//     return MaterialPage(
//       child: child,
//       key: Key(routeSettings.name!) as LocalKey,
//       name: routeSettings.name,
//       arguments: routeSettings.arguments,
//     );
//   }
//
//   bool canPop() {
//     LogUtils.log("canpop:${_pages.length}");
//     return _pages.length > 1;
//   }
//
//   bool _onPopPage(Route route, dynamic result) {
//     bool didPop = route.didPop(result);
//     LogUtils.log("onPopPage $didPop,${canPop()}");
//     if (!didPop) return false;
//
//     if (canPop()) {
//       _pages.removeLast();
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   void _setPath(List<Page> pages) {
//     _pages.clear();
//     _pages.addAll(pages);
//
//     if (_pages.first.name != '/') {
//       // _pages.insert(0, _createPage(const RouteSettings(name: '/')));
//     }
//     notifyListeners();
//   }
// }
