import 'package:UniPath/routes/HomePage.dart';
import 'package:UniPath/routes/add.dart';
import 'package:UniPath/routes/announcements.dart';
import 'package:UniPath/routes/search.dart';
import 'package:UniPath/routes/settings.dart';
import 'package:UniPath/routes/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:UniPath/routes/welcome.dart';
import 'package:UniPath/routes/login.dart';
import 'package:UniPath/routes/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            print('Cannot connect to firebase: '+snapshot.error.toString());
            return MaterialApp(
              home: Welcome(analytics: analytics, observer: observer),
            );
          }
          if(snapshot.connectionState == ConnectionState.done) {
            FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
            print('Firebase connected');
            return AppBase();
          }

          return MaterialApp(
            home: UnknownWelcome(),
          );
        }
    );
  }
}

class AppBase extends StatelessWidget {

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
        value: AuthService().user,
    initialData: null,
    child: MaterialApp(
    navigatorObservers: <NavigatorObserver>[observer],
    home: HomePage(analytics: analytics, observer: observer),
    routes: {
        '/walkthrough': (context) => WalkThrough(analytics: analytics, observer: observer),
        '/welcome': (context) => Welcome(analytics: analytics, observer: observer),
        '/login': (context) => Login(analytics: analytics, observer: observer),
        '/signup': (context) => SignUp(analytics: analytics, observer: observer),
        '/search' : (context) => Search(analytics: analytics, observer: observer),
        '/settings' : (context) => Settings(analytics: analytics, observer: observer),
        '/HomePage' : (context) => HomePage(analytics: analytics, observer: observer),

      },
    );
  }
}