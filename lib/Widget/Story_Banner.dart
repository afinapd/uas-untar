import 'package:flutter/material.dart';
import 'package:uts/Data/storys.dart';
import 'package:uts/Theme/Colors.dart';
import 'package:uts/Widget/Story_Item.dart';
import 'package:uts/DataModels/users.dart';
import 'package:uts/Services/story.dart';

class StoryBanner extends StatefulWidget {
  const StoryBanner({Key? key}) : super(key: key);

  @override
  State<StoryBanner> createState() => _StoryBannerState();
}

class _StoryBannerState extends State<StoryBanner> {
  late Future<List<Users>> futureRequest;

  @override
  void initState() {
    super.initState();
    futureRequest = getStory();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          border: Border.all(color: black, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(profile), fit: BoxFit.cover)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 19,
                          width: 19,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: white),
                          child: Icon(
                            Icons.add_circle,
                            color: buttonFollowColor,
                            size: 19,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Your Story',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: white,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: futureRequest,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Row(
                  children: List.generate(storys.length, (index) {
                    return StoryItem(
                      storyimg: snapshot.data[index].profile_image,
                      storyname: snapshot.data[index].username,
                    );
                  }),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
