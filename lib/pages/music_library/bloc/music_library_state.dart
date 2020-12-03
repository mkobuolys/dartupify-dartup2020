import 'package:equatable/equatable.dart';

import 'package:dartupify/pages/music_library/composite/imusic_library_item.dart';

class MusicLibraryState extends Equatable {
  const MusicLibraryState();

  @override
  List<Object> get props => [];
}

class MusicLibraryLoadInProgress extends MusicLibraryState {}

class MusicLibraryLoadSuccess extends MusicLibraryState {
  final List<IMusicLibraryItem> items;

  const MusicLibraryLoadSuccess({
    this.items = const [],
  });

  @override
  List<Object> get props => [items];

  @override
  String toString() {
    return 'MusicLibraryLoadSuccess { items: $items }';
  }
}
