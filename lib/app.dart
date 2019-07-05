import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'utils/colors.dart';
import 'pages/gallery.dart';
import 'pages/login.dart';
import './scoped-models/main.dart';

final ThemeData _kMomentsTheme = _buildMomentsTheme();

ThemeData _buildMomentsTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: kRegistrationBlack,
      primaryColor: kRegistrationBlack,
      scaffoldBackgroundColor: kMomentsWhite,
      cardColor: kMomentsWhite,
      errorColor: kMomentsErrorRed,
      textTheme: _buildMomentsTextTheme(base.textTheme),
      primaryTextTheme: _buildMomentsTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildMomentsTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: kRegistrationBlack),
      unselectedWidgetColor: kRegistrationBlack);
}

TextTheme _buildMomentsTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontFamily: 'Cookie',
          fontSize: 36.0,
          color: kRegistrationBlack,
        ),
        title: base.title.copyWith(
          fontSize: 18.0,
          fontFamily: 'DINOT',
          color: kRegistrationBlack,
        ),
        subtitle: base.title.copyWith(
          fontSize: 14.0,
          fontFamily: 'DINOT',
          color: kRegistrationBlack,
        ),
        caption: base.caption.copyWith(
          fontFamily: 'DancingScript',
          fontSize: 50.0,
          color: kRegistrationBlack,
        ),
        display1: base.display1.copyWith(
          fontFamily: 'DancingScript',
          fontSize: 14.0,
          color: kRegistrationBlack,
        ),
        button: base.button.copyWith(
          fontFamily: 'DancingScript',
          fontSize: 14.0,
          color: kMomentsWhite,
        ),
      );
}

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
