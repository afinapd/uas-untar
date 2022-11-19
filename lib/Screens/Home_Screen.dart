// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts/Data/post_json.dart';
import 'package:uts/Data/storys.dart';
import 'package:uts/Theme/Colors.dart';
import 'package:uts/Widget/Post_Items.dart';
import 'package:uts/Widget/Story_Banner.dart';
import 'package:uts/Widget/Story_Item.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            StoryBanner(),
            Divider(
              height: 1,
              color: white.withOpacity(0.2),
            ),
            PostItems(),
          ],
        ),
      ),
    );
  }
}
