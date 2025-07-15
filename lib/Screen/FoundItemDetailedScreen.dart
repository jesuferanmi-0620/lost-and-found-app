import 'package:flutter/material.dart';

class itemdetailscreen extends StatelessWidget {
  const itemdetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item Details')),
      body: Padding(padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Items Name',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
            Text('Detail description of the items goes here.'),
            SizedBox(height:10),
            Text('Location:Some place'),
          ],
        ),
      ),
    );
  }
}
