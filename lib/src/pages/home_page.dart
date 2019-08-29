import 'package:flutter/material.dart';
import 'package:flutter_peliculas_fh/src/providers/peliculas_provider.dart';
import 'package:flutter_peliculas_fh/src/widgets/card_swiper_widget.dart';

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

    final peliculasProvider = PeliculasProvider();
    peliculasProvider.getEnCines();

    return CardSwiper(
      peliculas: [1,2,3,4,5],
    );
  }
}