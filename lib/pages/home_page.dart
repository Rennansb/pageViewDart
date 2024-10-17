import 'package:exemplflutter2/pages/pageViews/one_page.dart';
import 'package:exemplflutter2/pages/pageViews/three.dart';
import 'package:exemplflutter2/pages/pageViews/two_pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int indexBottomNavigation = 0;
  String title = '';
  Color corBarra = Colors.blue;
  Color corIcone = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          TwoPages(),
          ThreePages(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: corBarra,
        iconSize: 40,
        currentIndex: indexBottomNavigation,
        onTap: (int page) {
          setState(() {
            indexBottomNavigation = page;
            page == 0
                ? corBarra = Colors.blue
                : page == 1
                    ? corBarra = Colors.red
                    : corBarra = Colors.yellow;

            page == 0
                ? corIcone = Colors.lightBlueAccent
                : page == 1
                    ? corIcone = Colors.redAccent
                    : corIcone = Colors.yellowAccent;
          });
          _pageController.animateToPage(page,
              duration: const Duration(microseconds: 600),
              curve: Curves.easeInCirc);
        },
        items: [
          BottomNavigationBarItem(
            label: 'One',
            icon: Icon(
              Icons.home,
              color: corIcone,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Two',
            icon: Icon(
              Icons.two_k,
              color: corIcone,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Three',
            icon: Icon(
              Icons.three_k,
              color: corIcone,
            ),
          ),
        ],
      ),
    );
  }
}
