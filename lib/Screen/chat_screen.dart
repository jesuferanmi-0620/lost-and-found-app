import 'package:flutter/material.dart';

class chatscreen extends StatelessWidget {
  const chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            title: Text('User1'),
            subtitle: Text('Hello, is this yours?'),
          ),
          ListTile(
            title: Text('User2'),
            subtitle: Text('Yes, where can I pick it up?'),
          ),
        ],
      ),
    );
  }
}
