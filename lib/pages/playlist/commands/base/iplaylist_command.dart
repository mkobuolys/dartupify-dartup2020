import 'package:dartupify/domain/models/index.dart';

abstract class IPlaylistCommand {
  Playlist execute();
  Playlist undo();
}
