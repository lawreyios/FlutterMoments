import '../utils/colors.dart';
import '../utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:Moments/utils/constants.dart';
import 'package:Moments/scoped-models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Map<String, dynamic> _formData = <String, dynamic>{
    'name': '???',
    'guests': 0,
    'gender': 0,
    'bus': false,
  };

  BuildContext context;

  List<String> options = [];
  int _guestsCounter = 0;
  final _nameTextController = TextEditingController();
  bool _validateName = false;

  void _restFields() {
    _nameTextController.text = '';
    _formData = <String, dynamic>{
      'name': '???',
      'guests': 0,
      'gender': 0,
      'bus': false,
    };

    setState(() {
      _guestsCounter = 0;
      _validateName = false;
    });
  }

  void _showDialog(String title, String content) {
    // TODO: Implement Dialog
  }

  void _handleGenderChange(int value) =>
      setState(() => _formData['gender'] = value);

  void _handleTransportOption(bool value) =>
      setState(() => _formData['bus'] = value);

  Widget getNameInputListTile() {
    // TODO: Name Field
    return Container();
  }

  Widget getGuestsCounter() {
    // TODO: Add Guest Counter
    return Container();
  }

  Widget getSectionHeader(String title) {
    // TODO: Add Section Header
    return Container();
  }

  Widget getGenderOptions() {
    // TODO: Add Gender Options
    return Container();
  }

  Widget getBusServiceOption() {
    // TODO: Add Transport Options
    return Container();
  }

  Widget getSubmitButton() {
    // TODO: Add Submit Button
    return Container();
  }

  List<Widget> renderForm() {
    return [
      getNameInputListTile(),
      getSectionHeader('Guest Information'),
      getGuestsCounter(),
      getGenderOptions(),
      getSectionHeader('Transport'),
      getBusServiceOption(),
      getSubmitButton()
    ];
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new Scaffold(
      body: ListView(children: renderForm()),
    );
  }

  void _submitForm() {
    _formData['name'] = _nameTextController.text;

    setState(() {
      _nameTextController.text.isEmpty
          ? _validateName = true
          : _validateName = false;
    });

    MainModel _model = ScopedModel.of(context);

    if (!_validateName) {
      final bool success = _model.submit(_formData);
      if (success) {
        showDialog<dynamic>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Your Submission is Successful!'),
                content: Text('Thank you for your participation!'),
                actions: <Widget>[
                  FlatButton(
                    child: Text(ALERT_OK),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _restFields();
                    },
                  ),
                ],
              );
            });
      } else {
        _showDialog('Error', 'Something went wrong, Please try again later.');
      }
    } else {
      _showDialog('Missing Name', 'Please key in your name.');
    }
  }
}
