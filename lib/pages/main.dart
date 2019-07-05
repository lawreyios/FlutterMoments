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
    // TODO: Implement Login Text Field
  }

  Widget getPage(MainModel model) {
    // TODO: Implement Menu Items Population
  }

  @override
  Widget build(BuildContext context) {
    final MainModel _model = ScopedModel.of(context);

    return Scaffold(
      backgroundColor: kMomentsWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Menu',
          style: Theme.of(context).textTheme.headline
        ),
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
      // TODO: Implement Child View
      body: Column(),
    );
  }
}
