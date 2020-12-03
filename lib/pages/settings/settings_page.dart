import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:dartupify/widgets/platform/factory/index.dart';

class SettingsPage extends StatelessWidget {
  static const String route = '/settings';

  void _onUseCupertinoWidgetsChanged(bool useCupertino) {
    var targetPlatform =
        useCupertino ? TargetPlatform.iOS : TargetPlatform.android;

    debugDefaultTargetPlatformOverride = targetPlatform;
    WidgetsBinding.instance.reassembleApplication();
  }

  @override
  Widget build(BuildContext context) {
    var widgetsFactory = context.watch<IPlatformWidgetsFactory>();

    return Scaffold(
      appBar: widgetsFactory.createAppBar('Settings', false),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Use Cupertino widgets'),
            trailing: widgetsFactory.createSwitcher(
              defaultTargetPlatform == TargetPlatform.iOS,
              _onUseCupertinoWidgetsChanged,
            ),
          ),
        ],
      ),
    );
  }
}
