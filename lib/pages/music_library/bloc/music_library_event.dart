import 'package:equatable/equatable.dart';

abstract class MusicLibraryEvent extends Equatable {
  const MusicLibraryEvent();

  @override
  List<Object> get props => [];
}

class MusicLibraryLoadStarted extends MusicLibraryEvent {}
