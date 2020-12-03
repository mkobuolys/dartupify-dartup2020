import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:dartupify/pages/music_library/composite/index.dart';
import 'package:dartupify/widgets/platform/factory/index.dart';
import 'package:dartupify/widgets/summary_text.dart';

class MusicLibraryPage extends StatelessWidget {
  static const route = '/music-library';

  final String title;
  final List<IMusicLibraryItem> musicLibraryItems;

  const MusicLibraryPage({
    @required this.title,
    @required this.musicLibraryItems,
  });

  @override
  Widget build(BuildContext context) {
    var widgetsFactory = context.watch<IPlatformWidgetsFactory>();

    return Scaffold(
      appBar: widgetsFactory.createAppBar(title),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: musicLibraryItems
                  .map<Widget>((item) => item.build(context))
                  .toList(),
            ),
          ),
          SummaryText(
            songsCount: musicLibraryItems.fold<int>(
              0,
              (prev, item) => prev + item.getItemsCount(),
            ),
            duration: musicLibraryItems.fold<int>(
              0,
              (prev, item) => prev + item.getDuration(),
            ),
          )
        ],
      ),
    );
  }
}
