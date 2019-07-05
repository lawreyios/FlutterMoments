import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'rich_list_item.dart';

class RichListItemCard extends StatefulWidget {
  final RichListItem item;

  const RichListItemCard(this.item);

  @override
  _RichListItemCardState createState() => _RichListItemCardState(item);
}

class _RichListItemCardState extends State<RichListItemCard> {
  RichListItem item;

  _RichListItemCardState(this.item);

  String renderUrl;

  Widget get itemImage {
    return Container(
      width: 125.0,
      height: 125.0,
      decoration: BoxDecoration(
        border: Border.all(color: kPlatinum),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(item.imagePath),
        ),
      ),
    );
  }

  Widget get list_item_card {
    return Padding(
      padding: EdgeInsets.only(top: 18, bottom: 16),
      child: Container(
        constraints: BoxConstraints(minWidth: 300),
        height: 130.0,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: kPlatinum, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 8.0,
              left: 95.0,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(widget.item.name,
                      style: Theme.of(context).textTheme.title),
                  Text(widget.item.description,
                      style: Theme.of(context).textTheme.subtitle),                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 150.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 45.0,
              child: list_item_card,
            ),
            Positioned(top: 20.5, child: itemImage),
          ],
        ),
      ),
    );
  }
}
