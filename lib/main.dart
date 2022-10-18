import 'package:flutter/material.dart';
import 'package:musicodio/home.dart';
import 'package:musicodio/homeprovider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<HomeProvider>(create: (context)=>HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>Home_Screen(),
        },
      ),
    )
  );
}