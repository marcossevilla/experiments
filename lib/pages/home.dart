import 'package:flutter/material.dart';

import '../app_localizations.dart';
import '../pages/settings.dart';

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
            onPressed: () => Navigator.of(context).pushNamed(
              SettingsPage.routeName,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.apps),
        onPressed: () {},
      ),
    );
  }
}
