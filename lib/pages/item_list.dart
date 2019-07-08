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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Padding(
              child: ListTile(
                title: Text(
                  _itemList[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(_itemList[index].subtitle,
                    style: Theme.of(context).textTheme.subtitle),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Divider(
              height: 5.0,
            )
          ],
        );
      },
      itemCount: _itemList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildItemList());
  }
}
