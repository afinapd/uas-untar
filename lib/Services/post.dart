import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uts/DataModels/users.dart';

Future<List<Users>> getPost() async {
  //replace your restFull API here.
  String url = "https://api.unsplash.com/search/photos?client_id=pVzm6xSeY08Xa9lfhC2gHwq7ZLMfXzv_6oQGcbfiB-g&per_page=10&query=one direction";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)["results"];

  //Creating a list to store input data;
  List<Users> users = [];
  for (var singlePost in responseData) {
    Users user = Users(
        id: singlePost["id"],
        profile_image: singlePost["user"]["profile_image"]["small"],
        username: singlePost["user"]["username"]);

    //Adding user to the list.
    users.add(user);
  }
  return users;
}