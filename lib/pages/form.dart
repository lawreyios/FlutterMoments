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
    // TODO #11: Implement Dialog
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text(ALERT_OK),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleGenderChange(int value) =>
      setState(() => _formData['gender'] = value);

  void _handleTransportOption(bool value) =>
      setState(() => _formData['bus'] = value);

  ListTile getNameInputListTile() {
    // TODO #12: Implement Name Section
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 16.0),
        child: Text('Your Name:', style: Theme.of(context).textTheme.subtitle),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Theme(
          data: ThemeData(
            primaryColor: kRegistrationBlack,
            primaryColorDark: kRegistrationBlack,
          ),
          child: Container(
            height: 40.0,
            child: TextField(
              style: Theme.of(context).textTheme.subtitle,
              controller: _nameTextController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                fillColor: kRegistrationBlack,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: kRegistrationBlack,
                  ),
                  onPressed: () {
                    _nameTextController.clear();
                  },
                ),
                hintText: NAME_HINT_TEXT,
                labelText: NAME_LABEL_TEXT,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getGuestsCounter() {
    // TODO #13: Add Guest Counter
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 8.0),
        child: Text('No. of Guests (Including yourself):',
            style: Theme.of(context).textTheme.subtitle),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            color: kRegistrationBlack,
            icon: Icon(Icons.remove),
            onPressed: () {
              if (_guestsCounter > 0) {
                setState(() => _guestsCounter--);
                _formData['guests'] = _guestsCounter;
              }
            },
          ),
          Text(
            _guestsCounter.toString(),
            style: Theme.of(context).textTheme.title,
          ),
          IconButton(
            color: kRegistrationBlack,
            icon: Icon(Icons.add),
            onPressed: () {
              if (_guestsCounter < 9) {
                setState(() => _guestsCounter++);
                _formData['guests'] = _guestsCounter;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget getSectionHeader(String title) {
    // TODO #14: Add Section Header
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 18, left: 22.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: Divider(
            color: kYankeesBlue,
          ),
        )
      ],
    );
  }

  Widget getGenderOptions() {
    // TODO #15: Add Gender Options
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 4.0),
        child: Text('Gender:', style: Theme.of(context).textTheme.subtitle),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            activeColor: kRegistrationBlack,
            value: 0,
            groupValue: _formData['gender'] as int,
            onChanged: _handleGenderChange,
          ),
          Text(
            GENDER_CHOICES[0],
            style: Theme.of(context).textTheme.subtitle,
          ),
          Radio(
            value: 1,
            activeColor: kRegistrationBlack,
            groupValue: _formData['gender'] as int,
            onChanged: _handleGenderChange,
          ),
          Text(
            GENDER_CHOICES[1],
            style: Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
    );
  }

  Widget getBusServiceOption() {
    // TODO #16: Add Transport Options
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Checkbox(
          activeColor: kRegistrationBlack,
          onChanged: _handleTransportOption,
          value: _formData['bus'] as bool,
        ),
        title: InkWell(
          onTap: () {
            setState(() {
              _formData['bus'] = !_formData['bus'];
            });
          },
          child: Text(
            'I need transport',
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
      ),
    );
  }

  Widget getSubmitButton() {
    // TODO #17: Add Submit Button
    return Padding(
      child: Center(
        child:
            MomentsButton(text: SUBMIT, action: _submitForm).getButton(context),
      ),
      padding: EdgeInsets.only(bottom: 16),
    );
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
