
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sellon/constant.dart';
import 'package:sellon/screen/landing.dart';
import 'package:sellon/widget/logo_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    onSession();
  }

  
  onSession() async {
    return Timer(defaultDuration * 5, (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const LandingPage();
      }));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
          gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [secondaryColor, primaryColor])
        ),
          child: Column(
            children: const <Widget>[
              Spacer(),
              LogoApp(color: Colors.white),
              SizedBox(height: defaultPadding * 10),
              Spacer()
            ],
          ),
        ),
      )
    );
  }
}
