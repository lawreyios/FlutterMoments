import 'package:flutter/material.dart';
import 'package:Moments/model/rich_list_item.dart';
import 'package:Moments/model/rich_list.dart';

class RichListPage extends StatelessWidget {
  final List<RichListItem> _list = [
    RichListItem(
        name: 'Scenery',
        description: 'Waterfall',
        imagePath: 'assets/pic1.jpg'),
    RichListItem(
        name: 'Iconic',
        description: 'Lighthouse',
        imagePath: 'assets/pic2.jpg'),
    RichListItem(
        name: 'Wild Life',
        description: 'Ostrich',
        imagePath: 'assets/pic3.jpg'),
    RichListItem(
        name: 'Surreal',
        description: 'Rain & Sea',
        imagePath: 'assets/pic4.jpg'),
    RichListItem(
        name: 'Symmetry',
        description: 'Deadend',
        imagePath: 'assets/pic5.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RichList(_list),
    );
  }
}
