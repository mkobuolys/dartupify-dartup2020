import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartupify/pages/music_library/bloc/music_library_event.dart';
import 'package:dartupify/pages/music_library/bloc/music_library_state.dart';
import 'package:dartupify/domain/services/music_library_service.dart';

class MusicLibraryBloc extends Bloc<MusicLibraryEvent, MusicLibraryState> {
  final MusicLibraryService musicLibraryService;

  MusicLibraryBloc({
    @required this.musicLibraryService,
  }) : super(MusicLibraryLoadInProgress());

  @override
  Stream<MusicLibraryState> mapEventToState(MusicLibraryEvent event) async* {
    if (event is MusicLibraryLoadStarted) {
      yield* _mapMusicLibraryLoadStartedToState();
    }
  }

  Stream<MusicLibraryState> _mapMusicLibraryLoadStartedToState() async* {
    var items = await musicLibraryService.getMusicLibraryItems();

    yield MusicLibraryLoadSuccess(items: items);
  }
}
