import 'package:flutter/cupertino.dart';

class CupertinoPageRouter extends PageRoute with CupertinoRouteTransitionMixin {
  final WidgetBuilder builder;

  CupertinoPageRouter({
    @required this.builder,
  });

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  bool get maintainState => false;

  @override
  String get title => '';
}
