import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uts/DataModels/photos.dart';

Future<List<Photos>> getPhotosShop() async {
  //replace your restFull API here.
  String url = "https://api.unsplash.com/search/photos?client_id=pVzm6xSeY08Xa9lfhC2gHwq7ZLMfXzv_6oQGcbfiB-g&per_page=20&query=blouse";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)['results'];

  //Creating a list to store input data;
  List<Photos> photos = [];
  for (var singlePhoto in responseData) {
    Photos photo = Photos(
        id: singlePhoto["id"],
        url: singlePhoto["urls"]["thumb"]);

    //Adding photo to the list.
    photos.add(photo);
  }
  return photos;
}