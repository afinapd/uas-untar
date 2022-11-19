import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uts/Data/search.dart';
import 'package:uts/Theme/Colors.dart';
import 'package:uts/DataModels/photos.dart';
import 'package:uts/Services/search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Photos>> futureRequest;

  @override
  void initState() {
    super.initState();
    futureRequest = getPhotosSearch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
              child: Container(
                width: double.infinity - 30,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: white.withOpacity(0.5)),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.8),
                      )),
                  style: TextStyle(color: white.withOpacity(0.4)),
                  cursorColor: white.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: FutureBuilder(
                future: futureRequest,
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2),
                      itemBuilder: (ctx, index) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(snapshot.data[index].url),
                                fit: BoxFit.cover)),
                      ),
                    );
                  }
                },
              ),
              // Container(
              //   color: Colors.black,
              //   child: GridView.builder(
              //     controller: ScrollController(),
              //     physics: BouncingScrollPhysics(),
              //     shrinkWrap: true,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
              //     itemBuilder: (_, index) => Container(
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage(searchImage[index]),
              //               fit: BoxFit.cover)),
              //     ),
              //     itemCount: searchImage.length,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
