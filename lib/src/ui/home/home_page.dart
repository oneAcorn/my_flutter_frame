import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_frame/src/constants/caches_contants.dart';
import 'package:my_flutter_frame/src/utils/caches_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showWelcome();
  }

  void _showWelcome() async {
    String userName = await CacheUtils.getString(CachesContants.userName);
    Fluttertoast.showToast(msg: "Welcome $userName");
  }
}
