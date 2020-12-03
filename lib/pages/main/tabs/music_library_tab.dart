import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartupify/pages/music_library/bloc/index.dart';
import 'package:dartupify/pages/music_library/music_library_page.dart';
import 'package:dartupify/widgets/platform/factory/index.dart';

class MusicLibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widgetsFactory = context.watch<IPlatformWidgetsFactory>();

    return BlocBuilder<MusicLibraryBloc, MusicLibraryState>(
      builder: (context, state) {
        if (state is MusicLibraryLoadInProgress) {
          return widgetsFactory.createLoader();
        } else if (state is MusicLibraryLoadSuccess) {
          return MusicLibraryPage(
            title: 'DartUPify',
            musicLibraryItems: state.items,
          );
        } else {
          return Container(
            child: Center(
              child: Text('Oops, something went wrong...'),
            ),
          );
        }
      },
    );
  }
}
