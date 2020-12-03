import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartupify/constants.dart';
import 'package:dartupify/domain/models/index.dart';
import 'package:dartupify/helpers/time_helper.dart';
import 'package:dartupify/pages/music_library/composite/imusic_library_item.dart';
import 'package:dartupify/pages/playlist/cubit/index.dart';
import 'package:dartupify/pages/playlist/commands/index.dart';
import 'package:dartupify/pages/playlist/memento/index.dart';

class MusicLibrarySong extends StatelessWidget implements IMusicLibraryItem {
  final Song data;

  const MusicLibrarySong({
    @required this.data,
    ValueKey key,
  }) : super(key: key);

  @override
  int getItemsCount() => 1;

  @override
  int getDuration() => data.duration;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit, PlaylistState>(
      builder: (context, state) {
        var playlist = state.playlist;
        var isInPlaylist = playlist.songs.contains(data);

        var originator = Originator(playlist);
        var command = isInPlaylist
            ? RemoveFromPlaylistCommand(
                originator: originator,
                song: data,
              )
            : AddToPlaylistCommand(
                originator: originator,
                song: data,
              );

        return Card(
          child: ListTile(
            title: Text(data.title),
            subtitle: Text(
                '${data.artist} | ${TimeHelper.secondsToText(getDuration())}'),
            leading: Icon(
              Icons.music_note,
              size: 40.0,
              color: kBlackColor,
            ),
            trailing: IconButton(
              icon: Icon(
                isInPlaylist ? Icons.star : Icons.star_border,
                color: kBlackColor,
              ),
              onPressed: () =>
                  context.read<PlaylistCubit>().executeCommand(command),
            ),
          ),
        );
      },
    );
  }
}
