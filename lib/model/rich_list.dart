import 'package:flutter/material.dart';

import '../model/rich_list_item.dart';
import '../model/rich_list_item_card.dart';

class RichList extends StatelessWidget {  
  const RichList(this.partners);

  final List<RichListItem> partners;

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: partners.length,
      itemBuilder: (BuildContext context, int index) {
        return RichListItemCard(partners[index]);
      },
    );
  }  
}
