import 'package:flutter/material.dart';
class reportlostitem extends StatelessWidget {
  const reportlostitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report lost items'),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
    child:Column(
    children:[TextField(decoration: InputDecoration(labelText: 'Item Name'),
    ),
    const SizedBox(height: 10),
    TextField(decoration: InputDecoration(labelText: 'Description'),
    maxLines:3,
    ),

    const SizedBox(height: 10),
    TextField(decoration: InputDecoration(labelText: 'Location Found'),
    ),
    const SizedBox(height: 10),
    ElevatedButton(onPressed: (){}, child: Text('Submit')
    ),
      ]
    ),
    ),
    );
  }
}
