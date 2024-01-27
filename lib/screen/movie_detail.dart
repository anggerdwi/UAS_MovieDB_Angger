import 'package:flutter/material.dart';
import 'package:uas_angger_moviedb_21201198/model/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;

  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    double screenHeight =
        MediaQuery.of(context).size.height;

    if (selectedMovie.posterPath != null){
      path = 'https://image.tmdb.org/t/p/w500/${selectedMovie.posterPath}';
    }else{
      path = 'https://images.tmdb.org/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
 
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMovie.title}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                height: screenHeight / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text('${selectedMovie.overview}'),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        // texticon rating with star
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.star, color: Colors.amber,),
                            Text(' ${selectedMovie.voteAverage} / 10'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const Icon(Icons.calendar_today, color: Colors.blue,),
                            Text(' ${selectedMovie.releaseDate}'),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text('Created By Angger Dwi Prasetia, NIM: 20201241'),
              ),
            ],
          ),
        ),
      )
    );
  }
}
