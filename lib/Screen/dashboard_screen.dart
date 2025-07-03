import 'package:flutter/material.dart';
import 'package:lost_found_app/Screen/chat_screen.dart';
import 'package:lost_found_app/Screen/lost_found_screen.dart';
import 'package:lost_found_app/Screen/notification_screen.dart';
import 'package:lost_found_app/Screen/report_found_item.dart';
import 'package:lost_found_app/Screen/report_lost_item.dart';

class dashboard_screen extends StatefulWidget {
  const dashboard_screen({super.key});

  @override
  State<dashboard_screen> createState() => _dashboard_screenState();
}

class _dashboard_screenState extends State<dashboard_screen> {
  int _currrentIndex = 0;
  final List<Widget> _screens = const [
    lostfoundscreen(),
    reportlostitem(),
  reportfounditem(),
    chatscreen(),
    notificationscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currrentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index){
            setState(() {
              _currrentIndex = index;
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
