import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack/stack.dart';

import 'package:dartupify/pages/playlist/commands/index.dart';
import 'package:dartupify/pages/playlist/cubit/playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final Stack<IPlaylistCommand> commandHistory = Stack();

  PlaylistCubit() : super(PlaylistState.init());

  void executeCommand(IPlaylistCommand command) {
    commandHistory.push(command);

    var playlist = command.execute();
    var updatedState = state.copyWith(
      playlist: playlist,
      isCommandHistoryEmpty: false,
    );

    emit(updatedState);
  }

  void undoLastCommand() {
    if (commandHistory.isNotEmpty) {
      var playlistCommand = commandHistory.pop();
      var playlist = playlistCommand.undo();

      emit(state.copyWith(
        playlist: playlist,
        isCommandHistoryEmpty: commandHistory.isEmpty,
      ));
    }
  }
}
