import 'package:flutter/material.dart';
import 'package:flutter_peliculas_fh/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Tomo los argumentos que se envian por el nombre de la ruta
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(pelicula.title),
      ),
    );
  }
}