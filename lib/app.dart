import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'utils/theme.dart';
import 'pages/gallery.dart';
import 'pages/login.dart';
import './scoped-models/main.dart';

final ThemeData _kMomentsTheme = MomentsTheme().data;

class MomentsApp extends StatefulWidget {
  @override
  MomentsAppState createState() => MomentsAppState();
}

class MomentsAppState extends State<MomentsApp> {
  final MainModel _model = MainModel();

  Widget _defaultHome;

  @override
  void initState() {
    _defaultHome = LoginPage(_model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moments',
        home: _defaultHome,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => GalleryPage(),
          '/login': (BuildContext context) => LoginPage(_model)
        },
        theme: _kMomentsTheme,
      ),
    );
  }
}
