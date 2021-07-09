import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_preferences/preferences_user.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero;

  final prefs = PreferencesUser();

  TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes de Usuario'),
          backgroundColor: (prefs.colorSecundario) ? Colors.amber : Colors.blue,
        ),
        drawer: MenuDrawer(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color Secundario'),
              onChanged: (value) {
                _colorSecundario = value;
                prefs.colorSecundario = value;
                setState(() {});
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de quien usa el telefono',
                ),
                onChanged: (value) => prefs.nombreUsuario = value,
              ),
            )
          ],
        ));
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    setState(() => _genero = valor);
  }
}
