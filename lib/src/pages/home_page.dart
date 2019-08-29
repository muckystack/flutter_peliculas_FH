import 'package:flutter/material.dart';
import 'package:flutter_peliculas_fh/src/providers/peliculas_provider.dart';
import 'package:flutter_peliculas_fh/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  
  final peliculasProvider = new PeliculasProvider();

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _swiperTargetas(),
                _footer(context)
              ],
            ),
          ],
        )
      )
    );
  }

  Widget _swiperTargetas() {

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        }else {
          return Container(
            height: 300.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
    
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          // Le agrego estilos globales
          Text('Populares', style: Theme.of(context).textTheme.subhead),
          FutureBuilder(
            future: PeliculasProvider().getPopulares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.data) {
                print(snapshot.data);
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}