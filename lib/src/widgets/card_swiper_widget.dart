import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  // Variables y contantes
  final List<dynamic> peliculas;

  // Defino el contructor de nuevo widget, '@required' es para decir que el parametro es requerido y si no nocunfuona
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 300.0,
      child: Swiper(
        // Nos amontona el contenid en una lista detras de otra
        layout: SwiperLayout.STACK,
        // Indica el ancho que tendran las targeta sdel swiper
        itemWidth: 200.0,
        itemBuilder: (BuildContext context,int index){
          // return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
          return new FadeInImage(
            image: NetworkImage('url'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        // Indica la cantidad de puntos que ponde debajo de las imagenes
        pagination: new SwiperPagination(),
        // Indica el cotrol para pasar de una imagen a otra
        // control: new SwiperControl(),
      ),
    );
  }
}