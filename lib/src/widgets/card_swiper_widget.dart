import 'package:flutter/material.dart';
import 'package:flutter_peliculas_fh/src/models/pelicula_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  // Variables y contantes
  final List<Pelicula> peliculas;

  // Defino el contructor de nuevo widget, '@required' es para decir que el parametro es requerido y si no nocunfuona
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    // Utilizo mediaQuerys para saver el ancho y alto de todo mi contenedor
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      // duration: Duration(milliseconds: 555),
      height: _screenSize.height * .7,
      // color: Colors.grey,
      child: Swiper(
        // Nos amontona el contenid en una lista detras de otra
        layout: SwiperLayout.STACK,
        // Indica el ancho que tendran las targeta sdel swiper
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context,int index){
          // return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: new FadeInImage(
              image: NetworkImage(peliculas[index].getPosterImg()),
              placeholder: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: peliculas.length,
        // Indica la cantidad de puntos que ponde debajo de las imagenes
        // pagination: new SwiperPagination(),
        // Indica el cotrol para pasar de una imagen a otra
        // control: new SwiperControl(),
      ),
    );
  }
}