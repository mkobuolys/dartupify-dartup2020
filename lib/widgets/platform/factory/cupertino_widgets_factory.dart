import 'package:flutter/widgets.dart';

import 'package:dartupify/widgets/platform/cupertino_index.dart';
import 'package:dartupify/widgets/platform/factory/iplatform_widgets_factory.dart';

class CupertinoWidgetsFactory implements IPlatformWidgetsFactory {
  @override
  Widget createAppBar(String title, [bool showSettingsButton = true]) {
    return CupertinoAppBar(
      title: title,
      showSettingsButton: showSettingsButton,
    );
  }

  @override
  Widget createBottomNavigationBar(int currentIndex, ValueSetter<int> onTap) {
    return CupertinoBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }

  @override
  Widget createLoader() {
    return CupertinoLoader();
  }

  @override
  PageRoute createPageRouter(WidgetBuilder builder) {
    return CupertinoPageRouter(
      builder: builder,
    );
  }

  @override
  Widget createSwitcher(bool isActive, ValueSetter<bool> onChanged) {
    return CupertinoSwitcher(
      isActive: isActive,
      onChanged: onChanged,
    );
  }
}
