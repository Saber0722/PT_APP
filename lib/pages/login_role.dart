import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/register_page.dart';
import 'package:modernlogintute/components/logo_tile.dart';
import 'package:modernlogintute/pages/navigation_route.dart';

class RolePage extends StatefulWidget {
  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              width: 500, // Adjust the width to the desired size
              height: 200, // Adjust the height to the desired size
              child: LogoTile(imagePath: 'lib/images/Smart_Square.png'),
            ),
            SizedBox(height: 50),
            Center(
              child: Container(
                padding: EdgeInsets.all(10), // Add padding for the border
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey, // Border color
                    width: 2, // Border width
                  ),
                ),
                child: Text(
                  'Please choose your Login Role',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Button background color
                minimumSize: Size(350, 100), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () {
                // Handle Admin login here
                Navigator.pushNamed(context, loginRoute);
              },
              child: Text(
                'Admin',
                style: TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
              ),
            ),
            Container(
              width: 71.08,
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Button background color
                minimumSize: Size(350, 100), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () {
                // Handle Teacher login here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(role: 'Teacher', onTap: () {}),
                  ),
                );
              },
              child: Text(
                'Teacher',
                style: TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
              ),
            ),
            Container(
              width: 71.08,
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Button background color
                minimumSize: Size(350, 100), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () {
                // Handle Student login here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(role: 'Student', onTap: () {}),
                  ),
                );
              },
              child: Text(
                'Student',
                style: TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
              ),
            ),
            Container(
              width: 71.08,
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Button background color
                minimumSize: Size(350, 100), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () {
                // Handle Parent login here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(role: 'Parent', onTap: () {}),
                  ),
                );
              },
              child: Text(
                'Parent',
                style: TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
