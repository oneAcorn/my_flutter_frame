import 'package:flutter/material.dart';
import 'package:my_flutter_frame/src/bean/demo_bean.dart';

class DemoListWidget extends StatefulWidget {
  const DemoListWidget({Key? key}) : super(key: key);

  @override
  State<DemoListWidget> createState() => _DemoListWidgetState();
}

class _DemoListWidgetState extends State<DemoListWidget> {
  final _demoList = <DemoBean>[];
  final _titleFont = const TextStyle(fontSize: 18.0);
  final _subTitleFont = const TextStyle(fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      //分割线
      if (i.isOdd) return const Divider();
      // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
      // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
      final index = i ~/ 2;
      return _buildRow(_demoList[index]);
    });
  }

  Widget _buildRow(DemoBean bean) {
    return ListTile(
      title: Text(
        bean.title,
        style: _titleFont,
      ),
      subtitle: _buildSubtitle(bean),
      trailing: Icon(
        bean.isExpand ? Icons.expand_less : Icons.expand_more,
        color: Colors.blue[600],
      ),
      onTap: () {},
    );
  }

  Widget? _buildSubtitle(DemoBean bean) {
    if (bean.content?.isNotEmpty == true) {
      return Text(
        bean.content!,
        style: _subTitleFont,
      );
    }
    return null;
  }
}
