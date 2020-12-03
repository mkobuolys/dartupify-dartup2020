import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

@immutable
class MusicCollection extends Equatable {
  final int id;
  final String title;
  final int parentId;

  const MusicCollection({
    @required this.id,
    @required this.title,
    @required this.parentId,
  });

  factory MusicCollection.fromJson(Map<String, dynamic> json) =>
      MusicCollection(
        id: json['id'],
        title: json['title'],
        parentId: json['parentId'],
      );

  @override
  List<Object> get props => [id, title, parentId];

  @override
  String toString() {
    return 'MusicCollection { id: $id, title: $title, parentId: $parentId }';
  }
}
