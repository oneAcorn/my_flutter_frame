import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter_frame/app.dart';

import '../../constants/caches_contants.dart';
import '../../utils/caches_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    debugPrint("what???");
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/test.jpg'),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Hello World",
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          )
        ],
      )),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      Timer(const Duration(milliseconds: 1500), _jumpNext);
    }
  }

  void _jumpNext() async {
    String? userName = await CacheUtils.getString(CachesContants.userName);
    if (userName?.isNotEmpty == true) {
      delegate.replace(name: "/home", arguments: {'index': 0});
    } else {
      delegate.replace(name: "/login");
    }
  }
}
