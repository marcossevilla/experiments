import 'package:experiments/app_localizations.dart';
import 'package:experiments/providers/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../globals.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'login';

  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    
    final localizations = AppLocalizations.of(context);
    final LoginProvider _loginProvider = Provider.of<LoginProvider>(context);


    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          localizations.translate('login.name'),
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_home,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.google),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.facebookF),
            backgroundColor: Globals.kFacebookBlue,
          ),
        ],
      ),
    );
  }
}
