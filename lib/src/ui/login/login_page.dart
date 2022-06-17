import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_frame/app.dart';
import 'package:my_flutter_frame/src/constants/caches_contants.dart';
import 'package:my_flutter_frame/src/ui/login/custom_bg.dart';
import 'package:my_flutter_frame/src/utils/caches_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //貌似是Z轴的布局
        children: [
          const CustomBackground(),
          Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.lens,
                        color: Colors.red,
                      ),
                      border: UnderlineInputBorder(),
                      hintText: "用户名"),
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  //年龄
                  //输入类型:数字
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), hintText: "Age"),
                  controller: ageController,
                ),
                TextField(
                  //密码
                  enableSuggestions: false,
                  autocorrect: false,
                  //输入不可见
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), hintText: 'Password'),
                  controller: pwdController,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {},
                        child: const Text(
                          '注册',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: _login,
                        child: const Text(
                          '登录',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _login() {
    if (userNameController.text.isEmpty) {
      //简单写法
      // Fluttertoast.showToast(msg: "Pls input username");
      //with options
      Fluttertoast.showToast(
          msg: "Pls input username",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          fontSize: 16.0);
      return;
    }
    CacheUtils.saveString(CachesContants.userName, userNameController.text);
    delegate.replace(name: '/home');
  }
}
