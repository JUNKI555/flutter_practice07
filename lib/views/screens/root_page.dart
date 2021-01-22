import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'first_page.dart';
import 'second_paage.dart';

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.first);

enum PageType {
  first,
  second,
}

class RootPage extends StatelessWidget {
  final List<Widget> _pageList = <Widget>[
    FirstPage(),
    SecondPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final pageType = watch(pageTypeProvider);

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
          body: _pageList[pageType.state.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageType.state.index,
            onTap: (index) {
              pageType.state = PageType.values[index];
            },
            items: tabItems,
          ),
        );
      },
    );
  }
}
