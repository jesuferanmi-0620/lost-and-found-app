import 'package:flutter/material.dart';
import 'item_detail_screen.dart';
class lostfoundscreen extends StatelessWidget {
  const lostfoundscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Lost and Found items')),
      body: ListView.builder(itemCount: 10,
      itemBuilder: (context, index){
        return ListTile(
        title: Text('item #$index'),
    subtitle: const Text('Brief description of items'),
    onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => const itemdetailscreen(),
    ),
    );
    },
        );
    },
      ),
    );
  }
}
