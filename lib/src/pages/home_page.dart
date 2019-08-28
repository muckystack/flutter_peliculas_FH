import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      // Este widget sirbe para los dispositivos que tienen noch arriba o donde el dispositivo save que se puede desplegar la aplicación
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                _swiperTargetas()
              ],
            ),
          ],
        )
      )
    );
  }

  Widget _swiperTargetas() {
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