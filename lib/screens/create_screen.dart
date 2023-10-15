import 'package:crud_flutter/model/Item.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CreateScreen extends StatefulWidget {
  final Function(Item) onCreate;

  CreateScreen({required this.onCreate});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final description = descriptionController.text;
                final newItem = Item(DateTime.now().millisecondsSinceEpoch, name, description);
                widget.onCreate(newItem);
                Navigator.pop(context);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
