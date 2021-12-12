import 'package:UniPath/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:UniPath/utils/color.dart';
import 'package:flutter/services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:UniPath/utils/analytics.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.analytics, required this.observer})
      : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{

        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Colors.black;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end :Alignment.bottomCenter,
            colors: [AppColors.loginBackTop, AppColors.loginBackBottom]
          ),
        ),
        child: Center(
          child: Column(
            children:[
              Spacer(flex:5),

              IconButton(
                icon: Icon(Icons.add_a_photo_rounded),
                iconSize:125,
                color:Colors.white,
                onPressed:(){
                  //add the choosing photo function here.
                }
              ),

              Spacer(flex:3),

              Padding(
                padding: const EdgeInsets.fromLTRB(22,0,22,10),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: AppColors.TextFormBg,
                    filled: true,
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(320)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(22,10,22,10),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: AppColors.TextFormBg,
                    filled: true,
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(320)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(22,10,22,10),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: AppColors.TextFormBg,
                    filled: true,
                    hintText: 'Your Name',
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(320)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(22,10,22,12),
                child:
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: AppColors.TextFormBg,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.vpn_key_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(320)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),

              ElevatedButton(
                child: Text("Sign Up", style: TextStyle(fontSize:20.0),),
                style: ButtonStyle(overlayColor:
                  MaterialStateProperty.resolveWith(getColor),),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                  },
              ),

              Spacer(flex:10),

              TextButton(
                child: Text("Already have an account? Login!", style: TextStyle(fontSize:20.0),),
                style: ButtonStyle(overlayColor:
                  MaterialStateProperty.resolveWith(getColor),),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
              )
            ]
          )
        )
      ),
    );
  }
}



