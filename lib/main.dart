import 'package:flutter/material.dart';
import 'package:preferencias/src/pages/home_page.dart';
import 'package:preferencias/src/pages/settings_page.dart';
import 'package:preferencias/src/share_preferences/preferencias_usuario.dart';
 
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final prefers = new PreferenciasUsuario();
  await prefers.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  final prefs= new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName:(context)=>HomePage(),
        SettingsPage.routeName:(context)=>SettingsPage(),
      },      
      
    );
  }
}