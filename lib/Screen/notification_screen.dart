import 'package:flutter/material.dart';
class notificationscreen extends StatelessWidget {
  const notificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: const Text('Notifications')),
    body: ListView(
    padding: const EdgeInsets.all(16),
    children: const [
    ListTile(
    title: Text('New Lost Item Reported')),
    ListTile(
    title: Text('Someone Responded to your report')),
    ],
    ),
    );
  }
}