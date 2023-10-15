import 'package:crud_flutter/screens/create_screen.dart';
import 'package:crud_flutter/screens/home_screen.dart';
import 'package:crud_flutter/screens/update_screen.dart';
import 'package:flutter/material.dart';

import 'model/Item.dart';

void main() => runApp(MyApp());

class ItemCallback {
  final Function(Item) onUpdate;
  final Function(Item) onDelete;

  ItemCallback(this.onUpdate, this.onDelete);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(items: items, itemCallback: ItemCallback(onUpdateItem, onDeleteItem)),
      routes: {
        '/create': (context) => CreateScreen(onCreate: (Item item) {
          setState(() {
            items.add(item);
          });
        }),
        '/update': (context) {
          final item = ModalRoute.of(context)!.settings.arguments as Item;
          return UpdateScreen(item: item, onUpdate: onUpdateItem);
        },
      },
    );
  }

  void onUpdateItem(Item item) {
    final index = items.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      setState(() {
        items[index] = item;
      });
    }
  }

  void onDeleteItem(Item item) {
    setState(() {
      items.remove(item);
    });
  }
}
