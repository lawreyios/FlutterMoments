// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:Moments/utils/constants.dart';
import 'package:Moments/scoped-models/main.dart';
import '../utils/colors.dart';
import '../utils/buttons.dart';

class LoginPage extends StatefulWidget {
  final MainModel _model;

  LoginPage(this._model);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class AccentColorOverride extends StatelessWidget {
  AccentColorOverride({Key key, this.color, this.child}) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _mobileNumber;

  Widget _buildLoginTextField() {
    // TODO: Implement Login Text Field
    return Container();
  }

  Widget _buildEnterButton(BuildContext context) {
    // TODO: Implement Enter Button
  }

  void loginUser() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    final bool success = widget._model.loginUser(_mobileNumber);

    if (success) {
      Navigator.of(context).pushReplacementNamed('/home');
      _mobileNumberController.clear();
      _mobileNumber = '';
    } else {
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Code!'),
            content: Text('Please re-enter code again.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _mobileNumberController.clear();
                  _mobileNumber = '';
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      // TODO: Implement Login View
      body: Container(),
    );
  }
}
