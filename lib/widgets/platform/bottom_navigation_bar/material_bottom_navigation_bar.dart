import 'package:flutter/material.dart';

class MaterialBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueSetter<int> onTap;

  const MaterialBottomNavigationBar({
    @required this.currentIndex,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Library',
          icon: Icon(Icons.library_music),
        ),
        BottomNavigationBarItem(
          label: 'Playlist',
          icon: Icon(Icons.queue_music),
        ),
      ],
      onTap: onTap,
    );
  }
}
