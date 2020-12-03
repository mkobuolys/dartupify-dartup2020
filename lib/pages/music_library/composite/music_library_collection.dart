import 'package:flutter/material.dart';

import 'package:dartupify/constants.dart';
import 'package:dartupify/domain/models/index.dart';
import 'package:dartupify/pages/music_library/composite/imusic_library_item.dart';
import 'package:dartupify/pages/music_library/music_library_page.dart';

class MusicLibraryCollection extends StatelessWidget
    implements IMusicLibraryItem {
  final MusicCollection data;

  final List<IMusicLibraryItem> _items = <IMusicLibraryItem>[];

  MusicLibraryCollection({
    @required this.data,
  });

  void addItems(List<IMusicLibraryItem> items) {
    _items.addAll(items);
  }

  @override
  int getItemsCount() {
    return _items.fold<int>(
      0,
      (prev, item) => prev + item.getItemsCount(),
    );
  }

  @override
  int getDuration() {
    return _items.fold<int>(
      0,
      (prev, item) => prev + item.getDuration(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(data.title),
        leading: Icon(
          Icons.album,
          size: 40.0,
          color: kBlackColor,
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () => Navigator.pushNamed(
          context,
          MusicLibraryPage.route,
          arguments: <String, dynamic>{
            'title': data.title,
            'items': _items,
          },
        ),
      ),
    );
  }
}
