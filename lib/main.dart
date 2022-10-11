import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sellon/constant.dart';
import 'package:sellon/core/auth.dart';
import 'package:sellon/screen/navigation.dart';
import 'package:sellon/screen/landing.dart';
import 'package:sellon/screen/login.dart';
import 'package:sellon/screen/splash.dart';

Future<void> main() async {
  await dotenv.load(
    fileName: '.env'
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));

    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Sellon',
    theme: ThemeData(
    
    ),
    initialRoute: "/",
    routes: {
      '/': (BuildContext context) => new SplashScreen(),
      '/home': (BuildContext context) => new Navigation(),
      '/login': (BuildContext context) => new LoginPage(),
    },
    );
  }
}