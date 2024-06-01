import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
class LoginOrRegisterPage extends StatefulWidget{
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState()=> _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage>{

  // initially show login page
  bool showLogInPage=true;

  // toggle between login and register page
  void togglePages(){
    setState(() {
      showLogInPage=!showLogInPage;
    });
  }
  @override
  Widget build(BuildContext context){
    if (showLogInPage){
    return LoginPage(
      onTap: togglePages, role: '',
    );
  }
    else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}