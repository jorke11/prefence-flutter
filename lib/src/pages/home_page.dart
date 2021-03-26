import 'package:flutter/material.dart';
import 'package:preferencias/src/share_preferences/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home";

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de Usuarios"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color Secundaro ${prefs.colorSecundario}"),
          Divider(),
          Text("Genero ${prefs.genero}"),
          Divider(),
          Text("Nombre Usuario ${prefs.nombre}"),
          Divider(),
        ],
      ),
    );
  }
}
