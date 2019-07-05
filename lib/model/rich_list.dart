import 'package:flutter/material.dart';

import '../model/rich_list_item.dart';
import '../model/rich_list_item_card.dart';

class RichList extends StatelessWidget {  
  RichList(this.listItems);

  final List<RichListItem> listItems;

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (BuildContext context, int index) {
        return RichListItemCard(listItems[index]);
      },
    );
  }  
}
