import 'package:flutter/material.dart';
import 'package:uts/Services/story.dart';
import 'package:uts/Theme/Colors.dart';
import 'package:uts/Data/search.dart';
import 'package:uts/DataModels/photos.dart';
import 'package:uts/Services/shop.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late Future<List<Photos>> futureRequest;

  @override
  void initState() {
    super.initState();
    futureRequest = getPhotosShop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appFooterColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: Container(
                width: double.infinity - 30,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search shop',
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
          Container(
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: Container(
                  width: double.infinity - 30,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: textFieldBackground),
                  child: Center(
                    child: Text(
                      'Videos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
          Expanded(
            child:
            Container(
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
                            crossAxisCount: 2,
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
                // Padding(
                //   padding:
                //   const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                //   child: GridView.builder(
                //     controller: ScrollController(),
                //     physics: BouncingScrollPhysics(),
                //     shrinkWrap: true,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
                //     itemBuilder: (_, index) => Container(
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage(searchShop[index]),
                //               fit: BoxFit.cover)),
                //     ),
                //     itemCount: searchShop.length,
                //   ),
                // )
            ),
          ),
        ],
      ),
    );
  }
}
