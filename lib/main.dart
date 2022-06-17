import 'package:flutter/material.dart';
import 'package:my_flutter_frame/app.dart';
import 'package:my_flutter_frame/src/routing/my_route_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    delegate.push(name: '/splash');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: "Navigator 2.0",
        theme: ThemeData(primaryColor: Colors.blue),
        routeInformationParser: const MyRouteParser(),
        routerDelegate: delegate);
  }
}
