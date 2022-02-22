import 'package:fanpage/screens/authenticate/login.dart';
import 'package:fanpage/screens/authenticate/register.dart';
import 'package:fanpage/screens/authenticate/signup.dart';
import 'package:fanpage/screens/wrapper.dart';
import 'package:fanpage/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyArgRK9Pl-61EFe9Wns_tpFPR18RRYfFyA",
      appId: "1:1038727021735:android:bdd6920aa16ac8987a4782",
      messagingSenderId: "XXX",
      projectId: "fanpage-6ccb4",
    ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      // home: Wrapper(),
      home: SignUp(),

    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 5,
//       navigateAfterSeconds: new SecondScreen(),
//       backgroundColor: Colors.pink[100],
//       title: new Text('Flutter Splash Screen'),
//         image: Image.asset()      
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Splash Screen',
//       // home: Wrapper(),
//       home: SignUp(),
//     );
//   }
// }