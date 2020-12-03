import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

import 'package:dartupify/domain/models/index.dart';

class PlaylistState extends Equatable {
  final Playlist playlist;
  final bool isCommandHistoryEmpty;

  const PlaylistState({
    @required this.playlist,
    @required this.isCommandHistoryEmpty,
  });
  const PlaylistState.init()
      : playlist = const Playlist(),
        isCommandHistoryEmpty = true;

  @override
  List<Object> get props => [playlist];

  @override
  String toString() =>
      'PlaylistState { playlist: $playlist, isCommandHistoryEmpty: $isCommandHistoryEmpty }';

  PlaylistState copyWith({
    Playlist playlist,
    bool isCommandHistoryEmpty,
  }) =>
      PlaylistState(
        playlist: playlist ?? this.playlist,
        isCommandHistoryEmpty:
            isCommandHistoryEmpty ?? this.isCommandHistoryEmpty,
      );
}
