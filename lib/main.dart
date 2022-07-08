// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_import, unused_local_variable
import 'package:course_apps/pages/languege/langu.dart';
import 'package:course_apps/pages/routes/reset_pawword.dart';
import 'package:course_apps/pages/routes/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:course_apps/pages/home_screen.dart';
import 'package:course_apps/pages/routes/about.dart';
import 'package:course_apps/pages/routes/account.dart';
import 'package:course_apps/pages/routes/help.dart';
import 'package:course_apps/pages/routes/log_in.dart';
import 'package:course_apps/pages/routes/setting.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tbib_splash_screen/tbib_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      // initialRoute: '/login',
      routes: {
        '/signup': (context) => SignUp(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/account': (context) => AccountScreen(),
        '/settings': (context) => SettingSreen(),
        '/help': (context) => HelpScreen(),
        '/About': (context) => AboutScren(),
        '/reset': (context) => PasswordReset(),
        //'/lgout': (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Mlaعeb',
      theme: ThemeData(
         fontFamily : " RobotoCondensed",
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    String loadingString = 'Loading.....';
    return AnimatedSplashScreen(
      curve: Curves.fastOutSlowIn,
      splash: Image.asset('images/field.png'),
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.green,
      centered: true,
      splashIconSize: 450,
      duration: 2500,
    );
  }
}
