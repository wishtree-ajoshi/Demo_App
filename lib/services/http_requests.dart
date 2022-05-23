import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_http_demo/main.dart';
import 'package:post_http_demo/models/album_model.dart';

class HttpServices {
  String urlServices = url;

  /// Get method
  Future<List> getAlbum(urlServices) async {
    try {
      final response = await http.get(Uri.parse(urlServices));
      final data = jsonDecode(response.body) as List;
      switch (response.statusCode) {
        case 200:
          //print(response.statusCode);
          return data;
        case 404:
          throw Exception("Page not found");
        default:
          throw Exception("Oops something went wrong..!!");
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Post method
  Future<Album> createAlbum({title, urlServices}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': title,
        }),
      );

      switch (response.statusCode) {
        case 201:
          //print(response.statusCode);
          return Album.fromJson(jsonDecode(response.body)); //post
        case 404:
          throw Exception("Page not found");
        default:
          throw Exception("Oops something went wrong..!!");
      }
    } catch (onerror) {
      throw Exception("Internet Not Connected");
    }
  }

  Future<Album> updateAlbum({title, urlServices}) async {
    final response = await http.put(
      Uri.parse(urlServices),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    switch (response.statusCode) {
      case 200:
        return Album.fromJson(jsonDecode(response.body));
      default:
        throw Exception("Oops something went wrong..!!");
    }
  }
}
