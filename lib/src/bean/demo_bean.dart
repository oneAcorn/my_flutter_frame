class DemoBean {
  final String title;
  final String? content;
  final int? id;
  final List<DemoBean>? subList;
  bool isExpand = false;

  DemoBean(this.title, {this.content, this.id, this.subList});
}
