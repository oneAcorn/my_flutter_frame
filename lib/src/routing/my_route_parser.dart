import 'package:flutter/material.dart';
import 'package:my_flutter_frame/src/utils/LogUtils.dart';

class MyRouteParser extends RouteInformationParser<List<RouteSettings>> {
  const MyRouteParser() : super();

  @override
  Future<List<RouteSettings>> parseRouteInformation(
      RouteInformation routeInformation) {
    LogUtils.log("parseRouteInformation ${routeInformation.location}");
    final uri = Uri.parse(routeInformation.location!);
    //这里会莫名收到一个rounteInfomation.location="/"的消息.
    //所以返回/splash防止出现空白页面
    if (uri.pathSegments.isEmpty) {
      return Future.value([const RouteSettings(name: "/splash")]);
    }

    final routeSettings = uri.pathSegments
        .map((path) => RouteSettings(
            name: "/$path",
            //只取最后一个segment的参数
            arguments:
                path == uri.pathSegments.last ? uri.queryParameters : null))
        .toList();
    return Future.value(routeSettings);
  }

  @override
  RouteInformation restoreRouteInformation(List configuration) {
    final location = configuration.last.name;
    final arguments = _restoreArguments(configuration.last);
    return RouteInformation(location: '$location$arguments');
  }

  String _restoreArguments(RouteSettings routeSettings) {
    if (routeSettings.name != "/details") return "";
    var args = routeSettings.arguments as Map;
    return '?name=${args['name']}&imgUrl=${args['imgUrl']}';
  }
}
