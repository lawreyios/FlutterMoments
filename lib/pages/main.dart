import 'package:Moments/utils/colors.dart';
import 'package:Moments/model/menu_item.dart';
import 'package:Moments/pages/form.dart';
import 'package:Moments/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'item_list.dart';
import 'rich_list.dart';

class MainPage extends StatefulWidget {
  final MainModel model;

  MainPage(this.model);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MenuItem selectedMenuItem = MenuItem.form;

  List<Widget> buildMenuItems(MainModel model) {
    // TODO #8: Implement Building of Menu Items
    final List<String> images = [
      'assets/menu_form.png',
      'assets/menu_list.png',
      'assets/menu_richList.png'
    ];

    final List<String> menuTitles = ['Form', 'List', 'RichList'];

    final List<MenuItem> menuItems = [
      MenuItem.form,
      MenuItem.list,
      MenuItem.richList
    ];

    final List<Widget> columnItems = List<Widget>();

    for (var i = 0; i < menuTitles.length; i++) {
      bool isSelectedMenuItem = selectedMenuItem == menuItems[i];
      columnItems.add(
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              border: Border.all(
                  color:
                      isSelectedMenuItem ? kRegistrationBlack : Colors.white)),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedMenuItem = menuItems[i];
              });
            },
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(images[i]),
                    height: 40,
                    width: 40,
                    color: kRegistrationBlack,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(menuTitles[i],
                        style: Theme.of(context).textTheme.display1),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return columnItems;
  }

  Widget getPage(MainModel model) {
    // TODO #9: Implement Menu Items Population
    switch (selectedMenuItem) {
      case MenuItem.form:
        return FormPage();
      case MenuItem.list:
        return ItemListPage(model);
      case MenuItem.richList:
        return RichListPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MainModel _model = ScopedModel.of(context);

    return Scaffold(
      backgroundColor: kMomentsWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Menu', style: Theme.of(context).textTheme.headline),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _model.logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      // TODO #10: Implement Child View
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buildMenuItems(_model)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text("Hello ${_model.user.name}!",
                style: Theme.of(context).textTheme.headline),
          ),
          Expanded(child: getPage(_model))
        ],
      ),
    );
  }
}
