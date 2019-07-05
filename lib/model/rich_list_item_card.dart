import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'rich_list_item.dart';

class RichListItemCard extends StatefulWidget {
  final RichListItem item;

  RichListItemCard(this.item);

  @override
  _RichListItemCardState createState() => _RichListItemCardState(item);
}

class _RichListItemCardState extends State<RichListItemCard> {
  RichListItem item;

  _RichListItemCardState(this.item);

  String renderUrl;

  Widget get itemImage {
    // TODO: Implement List Item Image View
    return Container();
  }

  Widget get listItemCard {
    // TODO: Implement List Item Card View
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      // TODO: Implement List Item Image Card View
      child: Container(),
    );
  }
}
