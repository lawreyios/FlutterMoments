import 'package:scoped_model/scoped_model.dart';
import '../model/list_item.dart';

mixin ItemListModel on Model {
  List<ListItem> fetchItemList() {
    List<ListItem> _itemList = [
      ListItem(title: 'Item 1 Title', subtitle: 'Item 1 Subtitle'),
      ListItem(title: 'Item 2 Title', subtitle: 'Item 2 Subtitle'),
      ListItem(title: 'Item 3 Title', subtitle: 'Item 3 Subtitle'),
      ListItem(title: 'Item 4 Title', subtitle: 'Item 4 Subtitle'),
      ListItem(title: 'Item 5 Title', subtitle: 'Item 5 Subtitle'),
      ListItem(title: 'Item 6 Title', subtitle: 'Item 6 Subtitle'),
      ListItem(title: 'Item 7 Title', subtitle: 'Item 7 Subtitle'),
      ListItem(title: 'Item 8 Title', subtitle: 'Item 8 Subtitle'),
      ListItem(title: 'Item 9 Title', subtitle: 'Item 9 Subtitle'),
      ListItem(title: 'Item 10 Title', subtitle: 'Item 10 Subtitle')
    ];

    return _itemList;
  }
}
