import 'package:flutter/material.dart';
import 'package:my_flutter_frame/src/routing/my_route_path.dart';
import 'package:my_flutter_frame/src/ui/home/home_page.dart';
import 'package:my_flutter_frame/src/ui/login/login_page.dart';
import 'package:my_flutter_frame/src/ui/splash/splash_page.dart';
import 'package:my_flutter_frame/src/utils/LogUtils.dart';

/// 路由代理
/// ChangeNotifier: 通过notifyListeners()修改路由状态
/// PopNavigatorRouterDelegateMixin: 可以复用popRoute方法
class MyRouteDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final List<Page> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  List<Page> get currentConfiguration => List.of(_pages);

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    LogUtils.log("setNewRoutePath ${configuration.last.name}");

    _setPath(configuration
        .map((routeSettings) => _createPage(routeSettings))
        .toList());
    return Future.value(null);
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    //没有可弹出页面,弹出是否退出app弹框.
    return _confirmExit();
  }

  void push({required String name, dynamic arguments}) {
    LogUtils.log("Route Delegate push $name,$arguments");
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  void replace({required String name, dynamic arguments}) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name, arguments: arguments);
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child;
    LogUtils.log("createPage:${routeSettings.name}");
    switch (routeSettings.name) {
      case '/splash':
        child = const SplashPage();
        break;
      case '/home':
        child = HomePage(routeSettings.arguments as Map<String, Object>);
        break;
      case '/login':
        child = const LoginPage();
        break;
      // case '/details':
      //   child = Details(routeSettings.arguments! as Map<String, String>);
      //   break;
      default:
        child = const Scaffold();
    }

    return MaterialPage(
      child: child,
      key: Key(routeSettings.name!) as LocalKey,
      name: routeSettings.name,
      arguments: routeSettings.arguments,
    );
  }

  bool canPop() {
    LogUtils.log("canpop:${_pages.length}");
    return _pages.length > 1;
  }

  bool _onPopPage(Route route, dynamic result) {
    bool didPop = route.didPop(result);
    LogUtils.log("onPopPage $didPop,${canPop()}");
    if (!didPop) return false;

    if (canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  void _setPath(List<Page> pages) {
    _pages.clear();
    _pages.addAll(pages);

    if (_pages.first.name != '/') {
      // _pages.insert(0, _createPage(const RouteSettings(name: '/')));
    }
    notifyListeners();
  }

  Future<bool> _confirmExit() async {
    LogUtils.log('???${navigatorKey.currentContext}');
    final result = await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: const Text('确定要退出App吗?'),
            actions: [
              TextButton(
                child: const Text('取消'),
                onPressed: () => Navigator.pop(context, true),
              ),
              TextButton(
                child: const Text('确定'),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          );
        });
    return result ?? true;
  }
}
