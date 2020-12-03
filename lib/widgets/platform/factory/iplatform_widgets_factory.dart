import 'package:flutter/widgets.dart';

abstract class IPlatformWidgetsFactory {
  Widget createAppBar(String title, [bool showSettingsButton = true]);
  Widget createBottomNavigationBar(int currentIndex, ValueSetter<int> onTap);
  Widget createLoader();
  PageRoute createPageRouter(WidgetBuilder builder);
  Widget createSwitcher(bool isActive, ValueSetter<bool> onChanged);
}
