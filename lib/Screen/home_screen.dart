import 'package:flutter/material.dart';
import 'package:lost_found_app/Screen/report_found_item.dart';
import 'package:lost_found_app/Screen/report_lost_item.dart';
import 'package:lost_found_app/Screen/notification_screen.dart';
import '/widget/search_bar_with_filter.dart';
import '/widget/report_button.dart';
import '/widget/category_card.dart';
import '/widget/item_card.dart';
import '/widget/bottom_contact_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showFoundItems = false;

  final List<Map<String, dynamic>> _recentItems = [
    {
      'imageUrl': 'https://example.com/image1.jpg',
      'title': 'iPhone 13 Pro',
      'description': 'Black, 256GB, found near cafeteria',
      'date': '2 hours ago',
      'location': 'Main Cafeteria',
      'status': 'Found',
    },
    {
      'imageUrl': 'https://example.com/image2.jpg',
      'title': 'Student ID Card',
      'description': 'John Doe, Computer Science Department',
      'date': '1 day ago',
      'location': 'Library',
      'status': 'Lost',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lost & Found',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.notifications, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const notificationscreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildReportButtonsRow(context),
            const SizedBox(height: 20),
            _buildCategoriesSection(),
            const SizedBox(height: 20),
            _buildItemsToggleSection(),
            const SizedBox(height: 20),
            _buildRecentItemsSection(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomContactBar(), // Custom contact bar
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Help reunite lost items',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 10),
        SearchBarWithFilter(),
      ],
    );
  }

  Widget _buildReportButtonsRow(BuildContext context) {
    return Row(
      children: [
        ReportButton(
          icon: Icons.report,
          label: 'Report Lost',
          color: Colors.red,
          onPressed: () => _navigateToReportScreen(context, isLost: true),
        ),
        const SizedBox(width: 10),
        ReportButton(
          icon: Icons.add_circle,
          label: 'Report Found',
          color: Colors.green,
          onPressed: () => _navigateToReportScreen(context, isLost: false),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1,
          children: const [
            CategoryCard(icon: Icons.devices, title: 'Electronics', count: 24),
            CategoryCard(icon: Icons.person, title: 'Personal', count: 18),
            CategoryCard(icon: Icons.vpn_key, title: 'Keys', count: 12),
            CategoryCard(icon: Icons.watch, title: 'Accessories', count: 15),
            CategoryCard(icon: Icons.diamond, title: 'Jewelry', count: 8),
            CategoryCard(icon: Icons.checkroom, title: 'Clothing', count: 10),
          ],
        ),
      ],
    );
  }

  Widget _buildItemsToggleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text('Lost Items'),
          selected: !_showFoundItems,
          onSelected: (_) => setState(() => _showFoundItems = false),
        ),
        const SizedBox(width: 10),
        ChoiceChip(
          label: const Text('Found Items'),
          selected: _showFoundItems,
          onSelected: (_) => setState(() => _showFoundItems = true),
        ),
      ],
    );
  }

  Widget _buildRecentItemsSection() {
    final filteredItems = _recentItems.where((item) {
      return _showFoundItems
          ? item['status'] == 'Found'
          : item['status'] == 'Lost';
    }).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Recent Items',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'View All',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: filteredItems
              .map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ItemCard(
              imageUrl: item['imageUrl'],
              title: item['title'],
              description: item['description'],
              date: item['date'],
              location: item['location'],
              status: item['status'],
              onTap: () {},
            ),
          ))
              .toList(),
        ),
      ],
    );
  }

  void _navigateToReportScreen(BuildContext context, {required bool isLost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
        isLost ? const reportlostitem() : const reportfounditem(),
      ),
    );
  }
}
