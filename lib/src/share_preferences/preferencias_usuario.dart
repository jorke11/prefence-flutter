import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._();
  SharedPreferences _prefs;

  PreferenciasUsuario._();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero{
    return _prefs.getInt("genero")??1;
  }

  set genero(int value){
    _prefs.setInt("genero", value);
  }
  
  get colorSecundario{
    return _prefs.getBool("color_secundario")??true;
  }

  set colorSecundario(bool value){
    _prefs.setBool("color_secundario", value);
  }

   get nombre{
    return _prefs.getString("nombre")??'';
  }

  set nombre(String value){
    _prefs.setString("nombre", value);
  }
  
  get ultimaPagina{
    return _prefs.getString("ultimaPagina")??'home';
  }

  set ultimaPagina(String value){
    _prefs.setString("ultimaPagina", value);
  }
}
