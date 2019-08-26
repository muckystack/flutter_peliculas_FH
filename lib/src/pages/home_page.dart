import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
      ),
      // Este widget sirbe para los dispositivos que tienen noch arriba o donde el dispositivo save que se puede desplegar la aplicación
      body: SafeArea(
        child: Text('Hola mundo!!!!!!!!'),
      )
    );
  }
}