import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sellon/constant.dart';
import 'package:sellon/screen/navigation.dart';
import 'package:sellon/widget/logo_app.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                secondaryColor,
                primaryColor
          ])),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: defaultPadding / 2,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                          Navigator.pushNamed(context, '/home');  
                      },
                      child: Text("Skip for Login",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppin',
                            color: Colors.white,
                          )))),
              SizedBox(
                height: defaultPadding * 4,
              ),
              LogoApp(color: Colors.white),
              Spacer(),
              Container(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    onPressed: () {
                       Navigator.pushNamed(context, '/login'); 
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      child: Text(
                        "Get Start",
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontFamily: 'Poppin'),
                      ),
                    )),
              ),
              SizedBox(
                height: defaultPadding * 4,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
