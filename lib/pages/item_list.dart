import 'package:flutter/material.dart';
import 'package:Moments/model/list_item.dart';
import 'package:Moments/scoped-models/main.dart';

class ItemListPage extends StatefulWidget {
  final MainModel model;

  ItemListPage(this.model);

  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<ListItem> _itemList = [];

  @override
  initState() {
    _itemList = widget.model.fetchItemList();
    super.initState();
  }

  Widget _buildItemList() {
    // TODO #18: Implement Item List
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildItemList());
  }
}
