import 'package:firebase_auth/firebase_auth.dart';
import 'package:vk_copy/firebase_helper/Firebase_auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:vk_copy/consts/strings.dart';
import '../../consts/images.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    var navBarItem =[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label: account),
    ];
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Выйти"),),

            ],
          ),
        ),
    );
  }
}
