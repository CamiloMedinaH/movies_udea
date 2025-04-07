import 'package:flutter/material.dart';
import 'package:movies_udea/pages/api_page.dart';
import 'package:movies_udea/pages/my_movies_page.dart';
import 'package:movies_udea/pages/my_profile_page.dart';

class HomeNavigationBarPage extends StatefulWidget {
  const HomeNavigationBarPage({super.key});

  @override
  State<HomeNavigationBarPage> createState() => _HomeNavigationBarPageState();
}

class _HomeNavigationBarPageState extends State<HomeNavigationBarPage> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    MyMoviesPage(),
    ApiPage(),
    MyProfilePage(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis peliculas"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Mis peliculas"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Api"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Mi Perfil"
            ),
          ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
