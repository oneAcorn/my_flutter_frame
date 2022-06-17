import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_frame/app.dart';
import 'package:my_flutter_frame/src/constants/caches_contants.dart';
import 'package:my_flutter_frame/src/ui/home/home_demo_subpage.dart';
import 'package:my_flutter_frame/src/ui/home/home_test_subpage.dart';
import 'package:my_flutter_frame/src/utils/caches_utils.dart';

class HomePage extends StatelessWidget {
  final int _selectedIndex;

  HomePage(Map<String, Object> arguments, {Key? key})
      : _selectedIndex = arguments['index'] as int,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdaptiveNavigationScaffold(
      selectedIndex: _selectedIndex,
      body: HomeWidget(_selectedIndex),
      onDestinationSelected: (index) {
        delegate.replace(name: '/home', arguments: {'index': index});
      },
      destinations: const [
        AdaptiveScaffoldDestination(title: "Demo", icon: Icons.home),
        AdaptiveScaffoldDestination(title: "Test", icon: Icons.architecture)
      ],
    ));
  }
}

class HomeWidget extends StatelessWidget {
  final int _index;

  const HomeWidget(int index, {Key? key})
      : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = const HomeDemoSubpage();
        break;
      case 1:
        child = const HomeTestSubpage();
        break;
      default:
        child = const Scaffold();
    }
    return child;
  }
}
