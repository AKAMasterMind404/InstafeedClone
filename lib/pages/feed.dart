import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pageinstaclone/data.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:pageinstaclone/test.dart';

class feed extends StatefulWidget {
  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  @override
  Widget build(BuildContext context) {
    double d = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(100)),
        width: d - 40,
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home_outlined),
                  color: Colors.white),
            ),
            InkWell(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.video_call_outlined),
                  color: Colors.white),
            ),
            InkWell(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.image_outlined),
                  color: Colors.white),
            ),
            InkWell(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person_outlined),
                  color: Colors.white),
            ),
          ],
        ),
      ),
//          Container(
//            child: Row(
//              children: [
//                Icon(Icons.home, color: Colors.white),
//                Icon(Icons.video_camera_back_outlined, color: Colors.white),
//                Icon(Icons.image, color: Colors.white),
//                Icon(Icons.person_outline, color: Colors.white)
//              ],
//            ),
//          ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              width: d,
              height: d / 5,
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              color: Colors.indigo,
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Spacer(flex: 1),
                  Container(
                    height: MediaQuery.of(context).size.width / 11,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.asset(
                      "lib/assets/insta.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(flex: 6),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: d / 16,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("lib/assets/woman1.jpg"),
                        radius: d / 18,
                      ),
                      Positioned(
                          top: d / 10,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              "LIVE",
                              style: TextStyle(
                                  color: Colors.white, fontSize: d / 40),
                            ),
                            padding: EdgeInsets.only(
                                left: 3, right: 3, top: 1, bottom: 1),
                          )),
                    ],
                  ),
                  Spacer(flex: 1),
                  Icon(
                    Icons.send_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: pList.length,
              itemBuilder: (BuildContext context, i) {
                return FeedCard(context, pList[i]);
              },
            )),
          ],
        ),
      ),
    ));
  }
}
//Container(
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: [
//Icon(Icons.home, color: Colors.white),
//Icon(Icons.video_camera_back_outlined, color: Colors.white),
//Icon(Icons.image, color: Colors.white),
//Icon(Icons.person_outline, color: Colors.white)
//],
//),
//)
