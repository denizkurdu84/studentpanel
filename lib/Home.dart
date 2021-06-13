import 'package:cbkmobil/OgrenciEkran.dart';
import 'package:cbkmobil/notify.dart';
import 'package:cbkmobil/takvim.dart';
import 'package:flutter/material.dart';

import 'calender.dart';
import 'colors/colors.dart';


class Home extends StatefulWidget {
  final String isim;
  final String soyisim;

  Home(this.isim, this.soyisim);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    onTapped(int index) {
      setState(
            () {
          _selectedItemIndex = index;
          print(_selectedItemIndex);
        },
      );
    }

    final List pages = [
      OgrenciEkran(widget.isim, widget.soyisim),
      null,
      Calender(),
      Takvim(),
      Notify()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Color(0xFFF9F9FB),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(
          color: Colors.blueGrey[600],
        ),
        currentIndex: _selectedItemIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Ana Sayfa',
            icon: Icon(Icons.home),
            
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.insert_chart),
          ),
          BottomNavigationBarItem(
            label: 'Takvim',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: 'Ödevler',
            icon: Icon(Icons.done),
          ),
          BottomNavigationBarItem(
            label: 'Bildirimler',
            icon: Image.asset("assets/images/notification.png"),
          ),
        ],
      ),
      backgroundColor: LightColors.kLightYellow,
      body: pages[_selectedItemIndex],
    );
  }
}
