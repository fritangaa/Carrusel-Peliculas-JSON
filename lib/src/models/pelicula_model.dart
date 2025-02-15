
class Peliculas {

  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList){

    if ( jsonList == null ) return ;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }

}

class Pelicula {

  String uniqueId;

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

  Pelicula.fromJsonMap(Map<String, dynamic> json){

    popularity        = json["popularity"] / 1;
    voteCount         = json["vote_count"];
    video             = json["video"];
    posterPath        = json["poster_path"];
    id                = json["id"];
    adult             = json["adult"];
    backdropPath      = json["backdrop_path"];
    originalLanguage  = json["original_language"];
    originalTitle     = json["original_title"];
    genreIds          = json["genre_ids"].cast<int>();
    title             = json["title"];
    voteAverage       = json["vote_average"] / 1;
    overview          = json["overview"];
    releaseDate       = json["release_date"];
   
  }


  getPosterImg(){
    if(posterPath == null){
      return "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";
    }else{
      return "https://image.tmdb.org/t/p/w500/$posterPath";
    }
  }

   getBackgroundImg() {

    if ( posterPath == null ) {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }

  }
}

