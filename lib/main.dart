import 'package:flutter/material.dart';
import 'package:pageinstaclone/pages/feed.dart';

void main()=>runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>feed()
      },
    )
);


