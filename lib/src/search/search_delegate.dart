import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';


class DataSearch extends SearchDelegate{


  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculasRecientes = [
    'Spiderman',
    'Capitan America'
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
      // TODO: acciones de app bar
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // TODO: icono a izquierda app bar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ), 
        onPressed: (){
          close(context,null);
        }
      );
    }

  @override
   Widget buildSuggestions(BuildContext context) {
     // Son las sugerencias que aparecen cuando la persona escribe

     if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {

          if( snapshot.hasData ) {
            
            final peliculas = snapshot.data;

            return ListView(
              children: peliculas.map( (pelicula) {
                  return ListTile(
                    leading: FadeInImage(
                      image: NetworkImage( pelicula.getPosterImg() ),
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      width: 50.0,
                      fit: BoxFit.contain,
                    ),
                    title: Text( pelicula.title ),
                    subtitle: Text( pelicula.originalTitle ),
                    onTap: (){
                      close( context, null);
                      pelicula.uniqueId = '';
                      Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                    },
                  );
              }).toList()
            );

          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }

      },
    );

   }

    @override
    Widget buildResults(BuildContext context) {
      // TODO: builder de resultados mostrados
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.blueAccent,
          child: Text(seleccion),
        ),
      );
  }

}