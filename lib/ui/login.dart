import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_copy/consts/icons.dart';
import 'package:vk_copy/consts/routes.dart';
import 'package:vk_copy/firebase_helper/Firebase_auth_helper.dart';
import 'package:vk_copy/mainpage/bottom_bar_view.dart';
import 'package:vk_copy/mainpage/bottom_pages/mainpage.dart';
import 'package:vk_copy/ui/forgot_password.dart';
import 'package:vk_copy/ui/sign_up.dart';

import '../consts/consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[700],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          reverse: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(height: 80,),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Image.asset(AppIcons.logo,color: Colors.white,),
                ),
                const SizedBox(height: 120,),
                 TextField(
                   controller: email,
                   style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(width: 3,color: Colors.blueAccent)
                    ),
                    hintStyle: TextStyle(color: Colors.white38),
                    hintText: "Email или телефон",
                  ),
                ),
                const SizedBox(height: 25,),
                 TextField(
                   controller: password,
                   style: TextStyle(color: Colors.white),
                   obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 3,color: Colors.blueAccent)
                      ),
                      hintStyle: TextStyle(color: Colors.white38),
                    hintText: "Пароль"
                  ),
                ),
                SizedBox(height: 3,),
                TextButton(onPressed: (){
                  Routes.instance.push(widget: ForgotPasswordPage(), context: context);
                }, child: Text("Забыли?",style: TextStyle(color: Colors.white38),)),
                SizedBox(height: 80,),
                Center(
                  child: CupertinoButton(
                    onPressed: () async {
                      bool isVaildated = loginVaildation(email.text, password.text);
                      if (isVaildated) {
                        bool isLogined = await FirebaseAuthHelper.instance
                            .login(email.text, password.text, context);
                        if (isLogined) {
                          Routes.instance.pushAndRemoveUntil(
                              widget: const CustomBottomBar(), context: context);
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 420,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text("Войти",style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                TextButton(onPressed: (){
                Routes.instance.push(widget: SignUpPage(), context: context);
                  }, child:Text("Зарегестрироваться",style: TextStyle(color: Colors.white),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
