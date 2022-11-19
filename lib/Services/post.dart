import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uts/DataModels/posts.dart';

Future<List<Posts>> getPost() async {
  //replace your restFull API here.
  String url = "https://api.unsplash.com/search/photos?client_id=pVzm6xSeY08Xa9lfhC2gHwq7ZLMfXzv_6oQGcbfiB-g&per_page=10&query=movie";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body)["results"];

  //Creating a list to store input data;
  List<Posts> posts = [];
  for (var singlePost in responseData) {
    Posts post = Posts(
        id: singlePost["id"],
        profile_image: singlePost["user"]["profile_image"]["small"],
        post: singlePost["urls"]["regular"],
        caption: singlePost["alt_description"],
        comment: singlePost["user"]["total_likes"],
        date: singlePost["user"]["updated_at"],
        likes_by: singlePost["liked_by_user"],
        likes_count: singlePost["likes"],
        is_loved: singlePost["user"]["accepted_tos"],
        username: singlePost["user"]["username"]);

    //Adding post to the list.
    posts.add(post);
  }
  return posts;
}