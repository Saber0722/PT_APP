import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'package:modernlogintute/pages/Parent/parent_view_attendance_or_marks_page.dart';
import 'package:modernlogintute/pages/Student/student_home_page.dart';
import 'package:modernlogintute/services/auth_service.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
import 'package:modernlogintute/pages/Parent/parent_view_attendance_or_marks_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  final String role; // Member variable to store the role
  const LoginPage({required this.onTap, required this.role});

  @override
  State<LoginPage> createState() => _LoginPageState(role: role);
}

class _LoginPageState extends State<LoginPage> {
  // Access the 'role' from the widget
  final String role;

  _LoginPageState({required this.role});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  Future<void> signUserIn(BuildContext context) async {
    try {
      // Sign in the user
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Retrieve user information (e.g., userCredential.user)
      final user = userCredential.user;

      if (user != null) {
        // Check the user's role or other attributes here
        // Example: You can check user.uid, user.email, or custom claims

        if (user.email == 'admin1@gmail.com') {
          // Navigate to the AdminPage for a user with a specific email
          Navigator.pushNamed(context, adminHomePageRoute);
        } else if (user.email == 'teacher@gmail.com') {
          Navigator.pushNamed(context, teacherHomePageRoute);
        } else if (user.email == 'parent1@gmail.com') {
          final Mail = user.email;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ParentHomePage(Mail: Mail!),
            ),
          );
        } else if (user.email == 'student1@gmail.com') {
          final Mail = user.email;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentHomePage(Mail: Mail!),
            ),
          );
        }
      } else {
        Navigator.pushNamed(context, homeRoute);
        // Handle the case where the user is null
      }
    } on FirebaseAuthException catch (e) {
      // Show error message
      showErrorMessage(context, 'Invalid Login Credentials');
    }
  }

  // show error message to user
  void showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, rolePageRoute);
            },
            icon: Icon(Icons.arrow_back_rounded),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: "Sign In",
                onTap: () => signUserIn(context),
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              
              

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, registerPageRoute);},
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
