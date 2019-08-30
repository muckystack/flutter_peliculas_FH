import 'package:flutter/material.dart';
import 'package:flutter_peliculas_fh/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;
  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  // Controlador del scroll de las vistas
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context) {

    // final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) siguientePagina();
    });

    return Container(
      height: 180.0,
      child: PageView.builder(
        // children: _targetas(context),
        itemCount: peliculas.length,
        itemBuilder: (context, i) => _targeta(context, peliculas[i]),
        pageSnapping: false,
        controller: _pageController
      ),
    );
  }

  Widget _targeta(BuildContext context, Pelicula pelicula) {


    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(pelicula.getPosterImg()),
              placeholder: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            pelicula.title,
            // Esta propiedad poe 3 puntos al final del texto cuando ya no cabe en su contenedor
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    // Este widget recopila todos los eventos que se ejecuten en el widget hijo
    return GestureDetector(
      onTap: () {
        // Paso argumentos por el nombre de la ruta
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
      child: tarjeta,
    );

  }

  List<Widget> _targetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/loading.gif'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              pelicula.title,
              // Esta propiedad poe 3 puntos al final del texto cuando ya no cabe en su contenedor
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}