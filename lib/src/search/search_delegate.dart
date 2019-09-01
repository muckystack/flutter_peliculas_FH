import 'package:flutter/material.dart';
import 'package:flutter_peliculas_fh/src/models/pelicula_model.dart';
import 'package:flutter_peliculas_fh/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';
  final peliculasProvider = PeliculasProvider();


  final peliculas = [
    'Pelicula 1',
    'Pelicula 2',
    'Pelicula 3',
    'Pelicula 4',
    'Pelicula 5',
  ];
  final peliculasRecientes = ['Spiderman', 'Capitan america'];

  // Son las acciones de nuestro appBar
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // En esta variable se almacena lo que se escribe en el input de search
          query = '';
        },
      ),
    ];
  }

  // Icono a la izquierda del appBar
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // print('Leading Icons Press');
        close(context, null);
      },
    );
  }

  // Es el Builder o la estruccion que crean los resultados que se van a mostrar
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.amberAccent,
        child: Text(seleccion),
      ),
    );
  }

  // Son las sugerencias que aparecen cuando la person a escribe
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) return Container();

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData) {

          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/loading-movie.gif'),
                  fit: BoxFit.cover,
                  width: 50.0,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: () {
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList()
          );
        }else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


  // // Son las sugerencias que aparecen cuando la person a escribe
  // @override
  // Widget buildSuggestions(BuildContext context) {

  //   final listaSugerida = (query.isEmpty)
  //                       ? peliculasRecientes
  //                       : peliculas.where( (p) =>
  //                         p.toLowerCase().startsWith(query.toLowerCase())                          
  //                       ).toList();


  //   // TODO: implement buildSuggestions
  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (BuildContext context, int index) {
  //     return ListTile(
  //       leading: Icon(Icons.movie),
  //       title: Text(listaSugerida[index]),
  //       onTap: () {
  //         seleccion = listaSugerida[index];
  //         showResults(context);
  //       },
  //     );
  //    },
  //   );
  // }

}