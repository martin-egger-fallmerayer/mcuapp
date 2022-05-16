import 'package:flutter/material.dart';
import 'package:mcuapp/widgets/screens/home/home_page.dart';
import 'package:mcuapp/widgets/screens/movies/movies_page.dart';
import 'package:mcuapp/widgets/screens/tvseries/tvseries_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    MoviesPage(),
    TvSeriesPage()
  ];

  // Attributes
  int _currentIndex = 0;

  // Methods
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        unselectedItemColor: Color.fromARGB(255, 194, 194, 194),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Series',
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: SafeArea(child: _pages.elementAt(_currentIndex))),
    );
  }
}
