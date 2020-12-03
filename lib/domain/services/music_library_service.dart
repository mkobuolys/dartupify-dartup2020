import 'package:meta/meta.dart';

import 'package:dartupify/domain/models/index.dart';
import 'package:dartupify/domain/repositories/music_library_repository.dart';
import 'package:dartupify/pages/music_library/composite/index.dart';

class MusicLibraryService {
  final MusicLibraryRepository repository;

  const MusicLibraryService({
    @required this.repository,
  });

  Future<List<IMusicLibraryItem>> getMusicLibraryItems() async {
    var collections = await repository.getCollections();
    var songs = await repository.getSongs();

    await Future.delayed(Duration(seconds: 3));

    return _buildMusicLibraryItems(collections, songs);
  }

  List<MusicLibraryCollection> _buildMusicLibraryItems(
    List<MusicCollection> collections,
    List<Song> songs,
  ) {
    var musicLibraryCollectionsMap = <int, MusicLibraryCollection>{
      for (var collection in collections)
        collection.id: MusicLibraryCollection(
          data: collection,
        )
    };

    for (var musicLibraryCollection in musicLibraryCollectionsMap.values) {
      var musicCollection = musicLibraryCollection.data;
      var parentId = musicCollection.parentId;

      if (musicLibraryCollectionsMap.containsKey(parentId)) {
        musicLibraryCollectionsMap[parentId].addItems([musicLibraryCollection]);
      }
    }

    _addSongsToCollections(musicLibraryCollectionsMap, songs);

    return musicLibraryCollectionsMap.values
        .where((musicLibraryCollection) =>
            musicLibraryCollection.data.parentId == null)
        .toList();
  }

  void _addSongsToCollections(
    Map<int, MusicLibraryCollection> musicLibraryCollectionsMap,
    List<Song> songs,
  ) {
    for (var musicLibraryCollection in musicLibraryCollectionsMap.values) {
      var collectionId = musicLibraryCollection.data.id;

      musicLibraryCollection.addItems(
        songs
            .where(
              (song) => song.collectionId == collectionId,
            )
            .map(
              (song) => MusicLibrarySong(
                data: song,
              ),
            )
            .toList(),
      );
    }
  }
}
