import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uts/DataModels/users.dart';

Future<List<Users>> getStory() async {
  //replace your restFull API here.
  String url = "https://api.unsplash.com/search/photos?client_id=pVzm6xSeY08Xa9lfhC2gHwq7ZLMfXzv_6oQGcbfiB-g&per_page=10&query=actors";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)["results"];

  //Creating a list to store input data;
  List<Users> users = [];
  for (var singleUsers in responseData) {
    Users user = Users(
        id: singleUsers["id"],
        profile_image: singleUsers["user"]["profile_image"]["small"],
        username: singleUsers["user"]["username"]);

    //Adding user to the list.
    users.add(user);
  }
  return users;
}