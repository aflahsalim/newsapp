import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/newsUser_model.dart';
import '../widgets/rounded_image.dart';
import 'login_screen.dart';


/// Contain information about current user profile

class ProfileScreen extends StatefulWidget {
  final NewsUser profile=NewsUser();

  static const routeName = '/profile';
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  NewsUser user = NewsUser();

  String ?profileText;
  getData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where('email', isEqualTo: "test@gmail.com")
        .get()
        .then((value) {
      setState(() {
        user = NewsUser.fromJson(value.docs.first.data());
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Button that logout user
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // AuthService().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            profileBody(),
          ],
        ),
      ),
    );
  }

  Widget profileBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage(
            path: widget.profile.profileImage!,
            width: 100,
            height: 100,
            borderRadius: 35),
        const SizedBox(height: 20),
        Text(
          user.name ?? "loading",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          user.email ?? "loading",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            profileText!,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}