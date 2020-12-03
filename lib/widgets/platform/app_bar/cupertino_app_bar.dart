import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dartupify/pages/playlist/cubit/index.dart';
import 'package:dartupify/pages/settings/settings_page.dart';

class CupertinoAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool showSettingsButton;

  const CupertinoAppBar({
    @required this.title,
    this.showSettingsButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(title),
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<PlaylistCubit, PlaylistState>(
            builder: (context, state) {
              return Visibility(
                visible: !state.isCommandHistoryEmpty,
                child: GestureDetector(
                  child: Icon(
                    CupertinoIcons.arrow_counterclockwise,
                    size: 24.0,
                  ),
                  onTap: () => context.read<PlaylistCubit>().undoLastCommand(),
                ),
              );
            },
          ),
          const SizedBox(width: 8.0),
          if (showSettingsButton)
            GestureDetector(
              child: Icon(
                CupertinoIcons.gear_alt,
                size: 24.0,
              ),
              onTap: () => Navigator.pushNamed(
                context,
                SettingsPage.route,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kMinInteractiveDimensionCupertino);
}
