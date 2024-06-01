import 'package:flutter/material.dart';
import 'package:modernlogintute/components/logo_tile.dart';
import 'package:modernlogintute/pages/admin/admin_view_all_users_page.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsHomePage extends StatefulWidget {
  @override
  _SettingsHomePageState createState() => _SettingsHomePageState();
}

class _SettingsHomePageState extends State<SettingsHomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String docIdToEdit = '';
  bool isSidePanelOpen = false; // Track whether the side panel is open or closed

  // Function to toggle the side panel
  void logout() {
   Navigator.pushNamed(context,loginRoute );
  }


  

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color.fromARGB(175, 188, 156, 227),
          title: Align(
            alignment: Alignment.centerLeft, 
            child: Text(
              'Smart Square',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            // Main content
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main
                  LogoTile(imagePath: 'lib/images/login_logo.png'),
                  SizedBox(height: 50),
                  Text(
                    'Select one of the following ',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Toggle back to Complaint Page
                      Navigator.pushNamed(context,complaintpageroute);
                    },
                    child: Text('Register a complaint?'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Toggle back to Rating Page
                        Navigator.pushNamed(context,apprRatingPageRoute);
                    },
                    child: Text('Rating'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Toggle back to the Login Page
                      Navigator.pushNamed(context, loginRoute);
                    },
                    child: Text('Sign Out'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Toggle back to the Privacy Page
                      Navigator.pushNamed(context, privacyPolicyPageRoute);
                    },
                    child: Text('Privacy Policy'),
                  ),
                ],
              ),
            ),
            // Side panel (AndroidLarge1)
          ],
        )
    );
  }
}

