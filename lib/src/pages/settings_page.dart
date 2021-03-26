import 'package:flutter/material.dart';
import 'package:preferencias/src/share_preferences/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = "Jorge";

  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Text("Settings"),
          ),
          Divider(),
          SwitchListTile(
              title: Text("Color secundario"),
              value: _colorSecundario,
              onChanged: _setColorSecundario),
          Divider(),
          RadioListTile(
              title: Text("Masculino"),
              value: 1,
              groupValue: _genero,
              onChanged: _setSeletedRadio),
          RadioListTile(
              title: Text("Femenino"),
              value: 2,
              groupValue: _genero,
              onChanged: _setSeletedRadio),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: "Nombre", helperText: "Nombre de la persona"),
              onChanged: (value) {
                prefs.nombre=value;
                setState(() {
                  
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void _setSeletedRadio(int value) {
    prefs.genero = value;
    setState(() {
      _genero = value;
    });
  }

  void _setColorSecundario(bool value) {
    prefs.colorSecundario = value;
    setState(() {
      _colorSecundario = value;
    });
  }
}
