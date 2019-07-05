import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MomentsButton extends RaisedButton {
  final String text;
  final Function action;

  MomentsButton({@required this.text, @required this.action});

  ButtonTheme getButton(BuildContext context) {
    return ButtonTheme(
      minWidth: 116.0,
      height: 33.0,
      child: RaisedButton(
        color: kRegistrationBlack,
        child: Text(text, style: Theme.of(context).textTheme.button),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        onPressed: () {
          action();
        },
      ),
    );
  }
}
