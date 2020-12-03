import 'package:meta/meta.dart';

import 'package:dartupify/domain/models/index.dart';
import 'package:dartupify/pages/playlist/commands/base/iplaylist_command.dart';
import 'package:dartupify/pages/playlist/memento/index.dart';

abstract class PlaylistCommand implements IPlaylistCommand {
  @protected
  final Originator originator;
  @protected
  final Memento backup;

  PlaylistCommand(this.originator) : backup = originator.createMemento();

  @override
  Playlist undo() {
    originator.restore(backup);

    return originator.state;
  }
}
