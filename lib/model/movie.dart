class Movie {
  int? id;
  String? title;
  double? voteAverage;
  String? releaseDate;
  String? overview;
  String? posterPath;

  Movie(this.id, this.title, this.voteAverage, this.releaseDate, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> json) { //1
    id = json['id'] as int;
    title = json['title'];
    voteAverage = json['vote_average'] * 1.0 as double;
    releaseDate = json["release_date"];
    overview = json["overview"];
    posterPath = json["poster_path"];
  }
} 

