import 'package:flutter/material.dart';
import 'package:my_flutter_frame/src/routing/my_route_path.dart';

/// 另一种写法
/// 可缺省,主要用于web，持有RouteInformationProvider 提供的 RouteInformation，可以将其解析为我们定义的数据类型
class MyRouteParser2 extends RouteInformationParser<MyRoutePath> {

  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async { //注意自己加上async关键字
    if (routeInformation.location == null) {
      throw Exception("routeInformation.location is null");
    }
    final uri = Uri.parse(routeInformation.location!);
    print("parseRouteInformation uri:$uri");
    if (uri.pathSegments.isEmpty) {
      return MyRoutePath.home();
    } else {
      return MyRoutePath.detail();
    }
  }
}
