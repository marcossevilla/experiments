import 'package:flutter/widgets.dart';

import '../pages/home.dart';
import '../pages/settings.dart';

const String initialRoute = HomePage.routeName;

Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (BuildContext context) => HomePage(),
  SettingsPage.routeName: (BuildContext context) => SettingsPage(),
};
