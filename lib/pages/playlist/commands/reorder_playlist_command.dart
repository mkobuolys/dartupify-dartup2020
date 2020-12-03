import 'package:meta/meta.dart';

import 'package:dartupify/domain/models/index.dart';
import 'package:dartupify/pages/playlist/commands/base/playlist_command.dart';
import 'package:dartupify/pages/playlist/memento/index.dart';

class ReorderPlaylistCommand extends PlaylistCommand {
  final Song song;
  final int oldIndex;
  final int newIndex;

  ReorderPlaylistCommand({
    @required Originator originator,
    @required this.song,
    @required this.oldIndex,
    @required this.newIndex,
  }) : super(originator);

  @override
  Playlist execute() {
    var playlist = backup.getState();
    var insertAtIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;

    return playlist.copyWith(
      songs: [...playlist.songs]
        ..removeAt(oldIndex)
        ..insert(insertAtIndex, song),
    );
  }
}
