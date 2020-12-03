import 'package:dartupify/domain/models/playlist.dart';
import 'package:dartupify/pages/playlist/memento/memento.dart';

class PlaylistMemento implements Memento {
  final Playlist _state;

  PlaylistMemento(Playlist playlist) : _state = Playlist.copy(playlist);

  @override
  Playlist getState() => _state;
}
