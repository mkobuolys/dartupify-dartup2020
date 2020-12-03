import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:dartupify/pages/main/tabs/index.dart';
import 'package:dartupify/widgets/platform/factory/index.dart';

class MainPage extends StatefulWidget {
  static const String route = 'main';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  void _onBottomNavigationBarItemTap(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widgetsFactory = context.watch<IPlatformWidgetsFactory>();

    return Scaffold(
      bottomNavigationBar: widgetsFactory.createBottomNavigationBar(
        _tabController.index,
        _onBottomNavigationBarItemTap,
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          MusicLibraryTab(),
          PlaylistTab(),
        ],
      ),
    );
  }
}
