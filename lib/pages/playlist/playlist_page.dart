import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartupify/domain/models/index.dart';
import 'package:dartupify/pages/music_library/composite/index.dart';
import 'package:dartupify/pages/playlist/commands/index.dart';
import 'package:dartupify/pages/playlist/cubit/index.dart';
import 'package:dartupify/pages/playlist/memento/index.dart';
import 'package:dartupify/widgets/platform/factory/index.dart';
import 'package:dartupify/widgets/summary_text.dart';

class PlaylistPage extends StatelessWidget {
  final Playlist playlist;

  const PlaylistPage({
    @required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    var widgetsFactory = context.watch<IPlatformWidgetsFactory>();

    return Scaffold(
      appBar: widgetsFactory.createAppBar('Playlist'),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView(
              children: [
                for (var song in playlist.songs)
                  MusicLibrarySong(
                    key: ValueKey(song),
                    data: song,
                  ),
              ],
              onReorder: (oldIndex, newIndex) {
                var command = ReorderPlaylistCommand(
                  originator: Originator(playlist),
                  song: playlist.songs[oldIndex],
                  oldIndex: oldIndex,
                  newIndex: newIndex,
                );

                context.read<PlaylistCubit>().executeCommand(command);
              },
            ),
          ),
          SummaryText(
            songsCount: playlist.songs.length,
            duration: playlist.songs.fold<int>(
              0,
              (prev, song) => prev + song.duration,
            ),
          )
        ],
      ),
    );
  }
}
