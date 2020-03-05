import 'package:flutter/widgets.dart';

import '../providers/login.dart';

import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/paint.dart';
import '../pages/settings.dart';

final LoginProvider _loginProvider = LoginProvider();

String initialRoute =
    _loginProvider.isLoggedIn ? HomePage.routeName : LoginPage.routeName;

Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (BuildContext context) => HomePage(),
  SettingsPage.routeName: (BuildContext context) => SettingsPage(),
  LoginPage.routeName: (BuildContext context) => LoginPage(),
  PaintPage.routeName: (BuildContext context) => PaintPage(),
};
