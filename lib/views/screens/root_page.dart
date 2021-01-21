import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/bottom_navigation_model.dart';
import 'first_page.dart';
import 'second_paage.dart';

class RootPage extends StatelessWidget {
  final List<Widget> _pageList = <Widget>[
    FirstPage(),
    SecondPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationModel>(
      create: (_) => BottomNavigationModel(),
      child: Consumer<BottomNavigationModel>(
        builder: (context, model, child) {
          final tabItems = [
            const BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: '',
            ),
          ];

          return Scaffold(
            body: _pageList[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: (index) {
                model.currentIndex = index;
              },
              items: tabItems,
            ),
          );
        },
      ),
    );
  }
}
