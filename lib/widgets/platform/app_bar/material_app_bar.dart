import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartupify/pages/playlist/cubit/index.dart';
import 'package:dartupify/pages/settings/settings_page.dart';

class MaterialAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showSettingsButton;

  const MaterialAppBar({
    @required this.title,
    this.showSettingsButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(title),
      actions: <Widget>[
        BlocBuilder<PlaylistCubit, PlaylistState>(
          builder: (context, state) {
            return Visibility(
              visible: !state.isCommandHistoryEmpty,
              child: IconButton(
                icon: Icon(Icons.replay),
                onPressed: () =>
                    context.read<PlaylistCubit>().undoLastCommand(),
              ),
            );
          },
        ),
        if (showSettingsButton)
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(
              context,
              SettingsPage.route,
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
