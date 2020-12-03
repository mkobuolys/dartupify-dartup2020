import 'package:flutter/widgets.dart';

import 'package:dartupify/widgets/platform/factory/iplatform_widgets_factory.dart';
import 'package:dartupify/widgets/platform/material_index.dart';

class MaterialWidgetsFactory implements IPlatformWidgetsFactory {
  @override
  Widget createAppBar(String title, [bool showSettingsButton = true]) {
    return MaterialAppBar(
      title: title,
      showSettingsButton: showSettingsButton,
    );
  }

  @override
  Widget createBottomNavigationBar(int currentIndex, ValueSetter<int> onTap) {
    return MaterialBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }

  @override
  Widget createLoader() {
    return MaterialLoader();
  }

  @override
  PageRoute createPageRouter(WidgetBuilder builder) {
    return MaterialPageRouter(
      builder: builder,
    );
  }

  @override
  Widget createSwitcher(bool isActive, ValueSetter<bool> onChanged) {
    return MaterialSwitcher(
      isActive: isActive,
      onChanged: onChanged,
    );
  }
}
