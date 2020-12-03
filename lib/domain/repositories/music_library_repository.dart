import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:dartupify/domain/models/index.dart';

class MusicLibraryRepository {
  Future<List<MusicCollection>> getCollections() async {
    var jsonList =
        await _getJsonList('assets/data/music_collections_data.json');
    var musicCollections = jsonList
        .map((collectionJson) => MusicCollection.fromJson(collectionJson))
        .toList();

    return musicCollections;
  }

  Future<List<Song>> getSongs() async {
    var jsonList = await _getJsonList('assets/data/songs_data.json');
    var songs = jsonList.map((songJson) => Song.fromJson(songJson)).toList();

    return songs;
  }

  Future<List<dynamic>> _getJsonList(String jsonPath) async {
    var jsonFile = await rootBundle.loadString(jsonPath);

    return json.decode(jsonFile) as List;
  }
}
