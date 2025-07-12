import 'package:flutter/material.dart';
import 'package:lost_found_app/Screen/chat_screen.dart';
import 'package:lost_found_app/Screen/home_screen.dart';
import 'package:lost_found_app/Screen/notification_screen.dart';
import 'package:lost_found_app/Screen/report_found_item.dart';
import 'package:lost_found_app/Screen/report_lost_item.dart';

class dashboard_screen extends StatefulWidget {
  const dashboard_screen({super.key});

  @override
  State<dashboard_screen> createState() => _dashboard_screenState();
}

class _dashboard_screenState extends State<dashboard_screen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    reportlostitem(),
  reportfounditem(),
    chatscreen(),
    notificationscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( title: Text('My Dashboard',
    style: TextStyle(color: Colors.white),),),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items:const[
            BottomNavigationBarItem(icon: Icon(Icons.list), label:'Items'),
            BottomNavigationBarItem(icon: Icon(Icons.report_gmailerrorred), label:'Lost'),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), label:'Found '),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label:'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label:'Alerts'),

    ],
      ),
    );
  }
}
