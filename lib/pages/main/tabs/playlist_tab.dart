import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartupify/pages/playlist/cubit/index.dart';
import 'package:dartupify/pages/playlist/playlist_page.dart';

class PlaylistTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit, PlaylistState>(
      builder: (context, state) {
        return PlaylistPage(
          playlist: state.playlist,
        );
      },
    );
  }
}
