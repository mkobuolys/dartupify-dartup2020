import 'package:flutter/cupertino.dart';

class CupertinoBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueSetter<int> onTap;

  const CupertinoBottomNavigationBar({
    @required this.currentIndex,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Library',
          icon: Icon(CupertinoIcons.music_albums),
        ),
        BottomNavigationBarItem(
          label: 'Playlist',
          icon: Icon(CupertinoIcons.music_note_list),
        ),
      ],
      onTap: onTap,
    );
  }
}
