import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/shared_preferences/preferences_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferencesUser();
  await prefs.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = PreferencesUser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: (prefs.colorSecundario) ? Colors.amber : Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Preferencias App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
