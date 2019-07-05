import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MomentsTheme {

  ThemeData _themeData;
  
  MomentsTheme() {
    this._themeData = _buildMomentsTheme();
  }

  ThemeData get data {
    return _themeData;
  }

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
}