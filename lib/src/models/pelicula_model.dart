class Peliculas {

  // Defino un arreglo donde se guardaran el nuevo json de peliculas
  List<Pelicula> items = List();

  // Creo un costructor vacio
  Peliculas();

  // Genero otro constructor con la función que se mandara a llamar para recibir todas las peliculas
  Peliculas.fromJsonList(List<dynamic> jsonList) {

    // En caso de que el arreglo sea vacio
    if(jsonList == null) return;

    // En caso de que si tenga datos
    for (var item in jsonList) {
      // Se hace la instancia al objeto Pelicula y se le pasa una película
      // Este objeto retorna un json de película
      final pelicula = Pelicula.fromJsonMap(item);
      // Se almacena el json de película en la lista de items
      items.add(pelicula);
    }

  }

}


class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {

    // Para que de un número doble
    popularity        = json['popularity'] / 1;
    voteCount         = json['vote_count'];
    video             = json['video'];
    posterPath        = json['poster_path'];
    id                = json['id'];
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    genreIds          = json['genre_ids'].cast<int>();
    title             = json['title'];
    voteAverage       = json['vote_average'] / 1;
    overview          = json['overview'];
    releaseDate       = json['release_date'];

  }
}
