import 'package:experiments/pages/paint.dart';
import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../pages/settings.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('home.appName')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text(AppLocalizations.of(context).translate('home.paint')),
              onPressed: () {
                Navigator.of(context).pushNamed(PaintPage.routeName);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.verified_user),
        onPressed: () => Navigator.of(context).pushNamed(LoginPage.routeName),
      ),
    );
  }
}
