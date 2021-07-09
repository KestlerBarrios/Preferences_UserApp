import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instancia = PreferencesUser.internal();

  factory PreferencesUser() {
    return _instancia;
  }
  SharedPreferences _prefs;

  PreferencesUser.internal();

  initPreferences() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET Y SET de Genero

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }
  // GET Y SET de Color Secundario

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }
  // GET Y SET de NombreUsuario

  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  // GET Y SET de ultima pantalla

  get lastScreen {
    return _prefs.getString('ultimaPagina') ?? '/';
  }

  set lastScreen(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
