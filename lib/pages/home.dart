import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablaperiodicagame/pages/home_page.dart';
import 'package:tablaperiodicagame/pages/tablaImage.dart';

import 'home_page_propiedades.dart';
import 'more_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  String _title = 'Inicio';
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          pageChanged(index);
        },
        children: [
          const Inicio(),
          const InicioProp(),
          const tablaImage(),
          const ElemetsTable(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'Elementos'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.archivebox),
              label: 'Propiedades'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.table),
            label: 'Tabla',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_sharp),
              label: 'Más'
          )
        ],
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
      switch(index){
        case 0: {_title = 'Elementos'; } break;
        case 1: {_title = 'Propiedades'; } break;
        case 2: {_title = 'Tabla'; } break;
        case 3: {_title = 'Más'; } break;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}



