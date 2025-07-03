import 'package:flutter/material.dart';
class reportfounditem extends StatelessWidget {
  const reportfounditem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report found item')),
      body: Padding(
          padding: EdgeInsets.all(16.0),
      child:Column(
          children:[TextField(decoration: InputDecoration(labelText: 'Item Name'),
    ),
    const SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: 'Description'),
            maxLines:3,
            ),
            
            const SizedBox(height: 10),
            TextField(decoration: InputDecoration(labelText: 'Location Lost'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){}, child: Text('Submit')
            ),

          ],
          ),
      ),
    );
  }
}
