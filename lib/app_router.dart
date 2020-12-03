import 'package:flutter/widgets.dart';

import 'package:dartupify/pages/main/main_page.dart';
import 'package:dartupify/pages/music_library/composite/index.dart';
import 'package:dartupify/pages/music_library/music_library_page.dart';
import 'package:dartupify/pages/settings/settings_page.dart';
import 'package:dartupify/widgets/platform/factory/index.dart';

class AppRouter {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
    IPlatformWidgetsFactory widgetsFactory,
  ) {
    switch (settings.name) {
      case MainPage.route:
        return widgetsFactory.createPageRouter(
          (_) => MainPage(),
        );
      case MusicLibraryPage.route:
        var arguments = settings.arguments as Map<String, dynamic>;
        var title = arguments['title'] as String;
        var items = arguments['items'] as List<IMusicLibraryItem>;
        return widgetsFactory.createPageRouter(
          (_) => MusicLibraryPage(
            title: title,
            musicLibraryItems: items,
          ),
        );
      case SettingsPage.route:
        return widgetsFactory.createPageRouter(
          (_) => SettingsPage(),
        );
      default:
        return widgetsFactory.createPageRouter(
          (_) => MainPage(),
        );
    }
  }
}
