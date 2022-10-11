import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sellon/constant.dart';
import 'package:sellon/core/api_client.dart';
import 'package:sellon/widget/label_input.dart';
import 'package:sellon/widget/logo_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _idLoading = false;
  bool _secure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  
   AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );

  showHide() {
    setState(() {
      _secure = !_secure;
    });
  }
  

  Future<void> loginhandle() async {

    showDialog(context: context,
    barrierDismissible: false, builder: (BuildContext context){
      return WillPopScope(child: alert, onWillPop: () async =>false);
    });

    dynamic res =
        await ApiClient().login(emailController.text, passwordController.text);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

      Navigator.pop(context);

    if (res['message'] == null) {
      print(res['token']);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res['token']);
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${res['message']}'),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }

  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultPadding / 3),
      borderSide:BorderSide(color: primaryColor, width: 1, style: BorderStyle.solid));

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   tileMode: TileMode.mirror,
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //   Colors.white.withOpacity(0.1)
              //   ,primaryColor
              // ])
              ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: SafeArea(
                child: Container(
              margin: EdgeInsets.all(defaultPadding / 2),
              child: Column(
                children: <Widget>[
                  LogoApp(color: primaryColor),
                  SizedBox(height: defaultPadding * 2),
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppin',
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      margin: EdgeInsets.only(top: defaultPadding),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          LabelInput(
                            label: "Email Address",
                            color: Colors.black,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return 'Email is required';
                              } else if (email != null &&
                                  !EmailValidator.validate(email)) {
                                return 'Email not valid';
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(defaultPadding / 2),
                                focusedBorder: border,
                                enabledBorder: border,
                                border: border,
                                filled: true,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                fillColor: Colors.white,
                                suffixIcon: Icon(
                                  Icons.alternate_email,
                                  color: secondaryColor.withOpacity(0.8),
                                ),
                                prefixIcon:
                                    Icon(Icons.mail, color: primaryColor),
                                hintText: 'mathilda@gmail.com'),
                            cursorColor: primaryColor,
                            autofocus: false,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          SizedBox(height: defaultPadding),
                          LabelInput(
                            label: "Password",
                            color: Colors.black,
                          ),
                          TextFormField(
                            controller: passwordController,
                            validator: (val) {
                              if(val!.length<8){
                                return 'minimal 8 character';
                              }
                              else if (val.isEmpty) {
                                return 'password required';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: _secure,
                            obscuringCharacter: "*",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.all(defaultPadding / 2),
                                  
                                focusedBorder: border,
                                enabledBorder: border,
                                border: border,
                              filled: true,
                              hintStyle: TextStyle(
                                  fontSize: 14,),
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.lock, color: primaryColor),
                              suffixIcon: IconButton(
                                  onPressed: showHide,
                                  color: primaryColor,
                                  icon: _secure ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
                              hintText: 'Enter Password',
                            ),
                          ),
                          SizedBox(
                            height: defaultPadding * 1.9,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                loginhandle();
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2)),
                            minWidth: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(defaultPadding * 0.5),
                              child: Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppin',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
          )),
    );
  }
}
