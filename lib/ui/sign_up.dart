import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_copy/consts/icons.dart';
import 'package:vk_copy/mainpage/bottom_bar_view.dart';
import 'package:vk_copy/ui/login.dart';

import '../consts/consts.dart';
import '../consts/routes.dart';
import '../firebase_helper/Firebase_auth_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
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
                const SizedBox(height: 25,),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: passwordConfirm,
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
                      hintText: "Повторите пароль"
                  ),
                ),
                SizedBox(height: 3,),
                SizedBox(height: 80,),
                Center(
                  child: CupertinoButton(
                    onPressed: () async {
                      bool isVaildated = signUpVaildation(
                          email.text, password.text);
                      if (isVaildated) {
                        bool isLogined = await FirebaseAuthHelper.instance
                            .signUp( email.text, password.text,context);
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
                      child: Text("Зарегестрироваться",style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                Row(
                  children: [
                    Text("У вас уже есть аккаунт?"),
                    TextButton(onPressed: (){
                      Routes.instance.push(widget: LoginPage(), context: context);
                    }, child:Text("Войти",style: TextStyle(color: Colors.white),)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
