import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wifies/pages/controls_page.dart';
import 'package:wifies/pages/display.dart';
import 'package:wifies/pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';
import 'widgets/themes.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context)=>AnimatedSplashScreen(duration: 3000,splashTransition: SplashTransition.fadeTransition, backgroundColor: Colors.blue, splash: Image.asset("assets/images/Wifies.jpg", 
              fit: BoxFit.cover,
              ), nextScreen: LoginPage()),
        MyRoutes.homeRoute: (context)=>Splash(),
        MyRoutes.loginRoute: (context)=>LoginPage(),
        MyRoutes.controlsRoute: (context)=>Controls(),
        MyRoutes.displayRoute: (context)=>Display(),
      },
      );
      }
    
  }
