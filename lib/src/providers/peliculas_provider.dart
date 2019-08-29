import 'dart:convert';

// Importo la libreria http
import 'package:http/http.dart' as http;
import 'package:flutter_peliculas_fh/src/models/pelicula_model.dart';

class PeliculasProvider {

  // Defino las variables para mandarlas a la API
  String _apikey    = '25aeb97ead93975f9ebcecdf1c92b816';
  String _url       = 'api.themoviedb.org';
  String _languaje  = 'es-ES';

  // Defino un metodo para hacer la petición GET a la API
  Future<List<Pelicula>> getEnCines() async {

    // Utilizando http concateno la url a la que se le va ha hacer la petición conlas variables
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'   : _apikey,
      'language'  : _languaje
    });

    // Mando la petición por GET a la url
    final resp = await http.get(url);
    // Tomo la respuesta en string plano y la combierto a JSON
    final decodedData = json.decode(resp.body);

    // print(decodedData['results']);

    // Mando llamar a mi Modelo donde lo parseara a un Json de peliculas
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    // print(peliculas.items[0].title);

    // Retorno la lista o Json de peliculas
    return peliculas.items;

  }

  // Defino un metodo para hacer la petición GET a la API
  Future<List<Pelicula>> getPopulares() async {

    // Utilizando http concateno la url a la que se le va ha hacer la petición conlas variables
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'   : _apikey,
      'language'  : _languaje
    });

    // Mando la petición por GET a la url
    final resp = await http.get(url);
    // Tomo la respuesta en string plano y la combierto a JSON
    final decodedData = json.decode(resp.body);

    // Mando llamar a mi Modelo donde lo parseara a un Json de peliculas
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    // Retorno la lista o Json de peliculas
    return peliculas.items;

  }

}