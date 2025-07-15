import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<AppNotification> notifications = [
    AppNotification(title: 'New Lost Item Reported', time: 'Just now'),
    AppNotification(title: 'Someone responded to your report', time: '5 mins ago'),
    AppNotification(title: 'Your found item has been confirmed', time: '2 hours ago'),
    AppNotification(title: 'Reminder: Check your recent reports', time: 'Yesterday'),
  ];

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications (${unreadCount} Unread)'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(
              notification.title,
              style: TextStyle(
                fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Text(notification.time),
            trailing: notification.isRead
                ? const Icon(Icons.check, color: Colors.grey)
                : const Icon(Icons.fiber_manual_record, color: Colors.red, size: 12),
            onTap: () {
              setState(() {
                notification.isRead = true;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opened: ${notification.title}')),
              );
            },
          );
        },
      ),
    );
  }
}

class AppNotification {
  final String title;
  final String time;
  bool isRead;

  AppNotification({
    required this.title,
    required this.time,
    this.isRead = false,
  });
}
