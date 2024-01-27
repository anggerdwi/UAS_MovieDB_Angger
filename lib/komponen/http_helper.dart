import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uas_angger_moviedb_21201198/model/movie.dart';

class HttpHelper{
/*
Kelas ini digunakan untuk mendapatkan data dari themoviedb
dengan metode Upcoming yang memberikan nilai return berupa teks
*/ 
  final String urlKey = 'api_key=bac62b51a5c9781dd3e15c13e1734d7d';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie?'
      'api_key=bac62b51a5c9781dd3e15c13e1734d7d&query=';
  final String urlTopRated = 'https://api.themoviedb.org/3/movie/top_rated?api_key=bac62b51a5c9781dd3e15c13e1734d7d&language=en-US';

  Future<String> getUpcoming() async{
    final Uri upcoming = Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);
    http.Response result = await http.get(upcoming);
    if(result.statusCode == HttpStatus.ok){
      String responseBody = result.body;
      return responseBody;
    }
    else {
      return '{}';
    }
  }

  Future<List> getUpComingAsList() async {
    final Uri upcoming =
    Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body); //1
      final movieObjects = jsonResponseBody['results']; //2
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      return [];
    }
  }

  Future<List> getTopRatedAsList() async {
    final Uri topRated = Uri.parse(urlTopRated);
    http.Response result = await http.get(topRated);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body); //1
      final movieObjects = jsonResponseBody['results']; //2
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      return [];
    }
  }

  Future<List> findMovies(String title) async {
    final Uri query = Uri.parse(urlSearchBase + title);
    http.Response hasilcari = await http.get(query);
    if (hasilcari.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(hasilcari.body); //1
      final movieObjects = jsonResponseBody['results']; //2
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      return [];
    }
  }

}