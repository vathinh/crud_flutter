import 'package:flutter/material.dart';
import '../model/Item.dart';

class UpdateScreen extends StatefulWidget {
  final Item item;
  final Function(Item) onUpdate;

  UpdateScreen({required this.item, required this.onUpdate});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.item.name);
    descriptionController = TextEditingController(text: widget.item.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Item'),
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
                final updatedName = nameController.text;
                final updatedDescription = descriptionController.text;
                final updatedItem = Item(widget.item.id, updatedName, updatedDescription);
                widget.onUpdate(updatedItem);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
