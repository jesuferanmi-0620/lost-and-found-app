import 'package:flutter/material.dart';
import 'package:lost_found_app/Screen/chat_screen.dart';


class BottomContactBar extends StatelessWidget {
  const BottomContactBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.message),
                label: const Text('Message'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add your call logic here
                },
                icon: const Icon(Icons.call),
                label: const Text('Call Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
