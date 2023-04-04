import 'package:flutter/material.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/screens/article_screen.dart';
import 'package:newsapp/screens/discover_screen.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newsapp/screens/login_screen.dart';
import 'package:newsapp/screens/profile_screen.dart';
import 'package:newsapp/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Application',
      theme: ThemeData(primarySwatch: Colors.grey, fontFamily: "Nunito"),
      initialRoute: '/login',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        ProfileScreen.routeName: (context) =>  ProfileScreen(),
      },
    );
  }
}
