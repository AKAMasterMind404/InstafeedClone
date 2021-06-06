import 'dart:core';
import 'package:flutter/material.dart';
import 'package:pageinstaclone/videoPlayerChewie.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

String numberParser(int theamount) {
  List symbol = ["k", "m", "b", "t"];

  String f = "";

  double s = 0;

  if (theamount >= 0 && theamount < 1000) {
    s = theamount / 1;
    return theamount.toString();
  } else if (theamount > 999 && theamount < 1000000) {
    s = theamount / 1000;
    f = symbol[0];
  } else if (theamount > 999999 && theamount < 1000000000) {
    s = theamount / 1000000;
    f = symbol[1];
  } else if (theamount > 999999999 && theamount < 1000000000000) {
    s = theamount / 1000000000;
    f = symbol[2];
  } else if (theamount > 999999999999 && theamount < 1000000000000000) {
    s = theamount / 1000000000000;
    f = symbol[3];
  }

  var sig = s;
  return sig.toStringAsFixed(2).toString() + f;
}

String desc = "Lorem ipsum dolor sit amet, "
    "consectetur adipiscing elit. Aenean ultricies nisi erat, "
    "sed sollicitudin orci sagittis quis. Maecenas vel pretium diam. "
    "Nulla ac maximus nunc. Suspendisse potenti. Phasellus laoreet "
    "pulvinar lacus, eu tristique metus blandit nec. "
    "Nullam eu libero odio.";

class PostInfo {
  String username, dpURL, postURL, location, description;
  int likes, comments;
  bool locallyLiked, locallyViewed;

  PostInfo(
      {
      this.locallyLiked=false,
      this.locallyViewed=false,
      required this.username,
      required this.dpURL,
      this.postURL = "",
      required this.location,
      required this.description,
      required this.likes,
      required this.comments});
}

List<PostInfo> pList = [
  PostInfo(
      username: "Lisa Morwell",
      dpURL: "lib/assets/woman1.jpg",
      postURL: "lib/posts/v1.mp4",
      location: "Dallas, USA",
      description: desc,
      likes: 3276,
      comments: 22),
  PostInfo(
      username: "Amanda",
      dpURL: "lib/assets/woman2.jpg",
      postURL: "lib/posts/p1.jpg",
      location: "Cape Squenersboy",
      description: desc,
      likes: 9501,
      comments: 64),
  PostInfo(
      username: "Stephanie",
      dpURL: "lib/assets/woman3.jpg",
      postURL: "lib/posts/v2.mp4",
      location: "Great Wan",
      description: desc,
      likes: 15273,
      comments: 190),
  PostInfo(
      username: "Jessica Grey",
      dpURL: "lib/assets/woman4.jpg",
      postURL: "lib/posts/v3.mp4",
      location: "Port Twinrsey",
      description: desc,
      likes: 4232345,
      comments: 2110),
  PostInfo(
      username: "Brittany Hills",
      dpURL: "lib/assets/woman6.jpg",
      location: "Maccuya Hills",
      postURL: "lib/posts/p2.jpg",
      description: desc,
      likes: 276,
      comments: 12),
  PostInfo(
      username: "Samantha Brown",
      dpURL: "lib/assets/woman7.jpg",
      postURL: "lib/posts/p3.jpeg",
      location: "Porior Du Cacli",
      description: desc,
      likes: 5546,
      comments: 72),
  PostInfo(
      username: "Ashley Hilton",
      dpURL: "lib/assets/woman8.jpg",
      postURL: "lib/posts/v5.mp4",
      location: "Mie",
      description: desc,
      likes: 91449,
      comments: 674),
  PostInfo(
      username: "Elizabeth Nicole",
      dpURL: "lib/assets/woman9.jpg",
      postURL: "lib/posts/p5.jpg",
      location: "Dallas, USA",
      description: desc,
      likes: 6554,
      comments: 65),
];

Widget FeedCard(BuildContext context, PostInfo p) {
  int mid = 15;
  double d2 = MediaQuery.of(context).size.width;
  String desc = "Lorem ipsum dolor sit amet, "
      "consectetur adipiscing elit. Aenean ultricies nisi erat, "
      "sed sollicitudin orci sagittis quis. Maecenas vel pretium diam. "
      "Nulla ac maximus nunc. Suspendisse potenti. Phasellus laoreet "
      "pulvinar lacus, eu tristique metus blandit nec. "
      "Nullam eu libero odio.";

  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 5)
    ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
    margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor:
                  p.locallyViewed?
                  Colors.white
                      :
                  Colors.pinkAccent,
                  radius: d2 / 16,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(p.dpURL),
                  radius: d2 / 18,
                ),
              ],
            ),
            SizedBox(width: d2/60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.username,
                  style: TextStyle(color: Colors.grey[900], fontSize: d2 / 25),
                ),
                Text(
                  p.location,
                  style: TextStyle(color: Colors.grey[600], fontSize: d2 / 35),
                ),
              ],
            ),
            Spacer(flex: 14),
            Icon(Icons.more_vert)
          ],
        ),
        SizedBox(height: 10,),
        Container(
          child:
          p.postURL[p.postURL.length-1]!='4'?
          Image.asset(p.postURL, fit: BoxFit.fill,)
          :
          AspectRatio(
            aspectRatio: 16/9,
            child: ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                  p.postURL,
              ),
            ),
          ),
//          margin: EdgeInsets.only(top: 10, left: 5, right: 5),
//          height: d2 / 1.5,
//          width: d2,
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    p.locallyLiked?
                    Icons.favorite
                        :
                    Icons.favorite_border,
                    size: d2 / mid,
                    color: Colors.pinkAccent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    numberParser(p.likes),
                    style: TextStyle(fontSize: d2 / 25),
                  )
                ],
              ),
              Spacer(flex: 1),
              Row(
                children: [
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: d2 / mid,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    numberParser(p.comments),
                    style: TextStyle(fontSize: d2 / 25),
                  )
                ],
              ),
              Spacer(flex: 8),
              Icon(
                Icons.send_rounded,
                size: d2 / mid,
                color: Colors.black,
              )
            ],
          ),
        ),
        Container(
          width: d2,
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 8),
          child: Flexible(
            child: Text(
              "${p.username}: ${p.description}",
              style: TextStyle(
                fontSize: d2 / 25,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
