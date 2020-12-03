import 'package:flutter/material.dart';

class MaterialPageRouter extends PageRoute with MaterialRouteTransitionMixin {
  final WidgetBuilder builder;

  MaterialPageRouter({
    @required this.builder,
  });

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  bool get maintainState => false;
}
