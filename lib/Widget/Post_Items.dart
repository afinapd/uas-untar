import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts/Data/post_json.dart';
import 'package:uts/Services/post.dart';
import 'package:uts/Theme/Colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uts/DataModels/posts.dart';
import 'package:uts/Services/post.dart';

class PostItems extends StatefulWidget {
  const PostItems({Key? key}) : super(key: key);

  @override
  State<PostItems> createState() => _PostItemsState();
}

class _PostItemsState extends State<PostItems> {
  late Future<List<Posts>> futureRequest;

  @override
  void initState() {
    super.initState();
    futureRequest = getPost();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureRequest,
      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Column(
              children: List.generate(
            posts.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data[index].profile_image),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                snapshot.data[index].username,
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/images/vertical_ellipsis_icon.svg',
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data[index].post),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                snapshot.data[index].is_loved
                                    ? 'assets/images/loved_icon.svg'
                                    : 'assets/images/love_icon.svg',
                                height: 25,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                'assets/images/comment_icon.svg',
                                height: 25,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(
                                'assets/images/message_icon.svg',
                                height: 25,
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/images/save_icon.svg',
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: snapshot.data[index].likes_by
                                      ? ''
                                      : 'Liked by',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: white,
                                      fontSize: 14),
                                ),
                                TextSpan(
                                  text: snapshot.data[index].likes_by
                                      ? ''
                                      : ' ${snapshot.data[index + 1].username}',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                TextSpan(
                                  text: snapshot.data[index].likes_by
                                      ? ''
                                      : ' and ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: white,
                                      fontSize: 14),
                                ),
                                TextSpan(
                                  text: snapshot.data[index].likes_by
                                      ? '${snapshot.data[index].likes_count} likes'
                                      : '${snapshot.data[index].likes_count} others',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${snapshot.data[index].username}',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                TextSpan(
                                  text: ' ${snapshot.data[index].caption}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: white,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "View all ${snapshot.data[index].comment} Comments",
                            style: TextStyle(
                                color: white.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${snapshot.data[index].date}',
                            style: TextStyle(
                                color: white.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ));
        }
      },
    );
  }
}
