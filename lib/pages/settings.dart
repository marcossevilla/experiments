import 'package:experiments/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_localizations.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('settings.name')),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Consumer<ThemeProvider>(
            builder: (context, state, child) {
              return SwitchListTile(
                value: state.useDarkTheme,
                onChanged: (_) {
                  state.setDarkTheme(!state.useDarkTheme);
                },
                title: Text(localizations.translate('settings.useDarkTheme')),
              );
            },
          ),
        ],
      ),
    );
  }
}
