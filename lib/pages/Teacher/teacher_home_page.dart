import 'package:flutter/material.dart';
import 'package:modernlogintute/components/logo_tile.dart';
import 'package:modernlogintute/pages/Teacher/teacher_assignments_page.dart';
import 'package:modernlogintute/pages/admin/admin_view_all_users_page.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/pages/side_panel.dart/settings.dart/settings_home_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_assignments_page.dart';

class TeacherHomePage extends StatefulWidget {
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String docIdToEdit = '';
  bool isSidePanelOpen = false; // Track whether the side panel is open or closed



  // Function to toggle the side panel
  void toggleSidePanel() {
    setState(() {
      isSidePanelOpen = !isSidePanelOpen;
    });
  }

  // Function to close the side panel when tapped outside
  void closeSidePanel() {
    if (isSidePanelOpen) {
      setState(() {
        isSidePanelOpen = false;
      });
    }
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      // Replace 'your_collection' with the actual collection name in Firestore
      final QuerySnapshot querySnapshot = await firestore.collection('Teacher').get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming you want to fetch data from the first document
        final DocumentSnapshot docSnapshot = querySnapshot.docs[0];
        final Map<String, dynamic> userData = docSnapshot.data() as Map<String, dynamic>;
        return userData;
      } else {
        // Handle the case where no data is found
        return {};
      }
    } catch (e) {
      // Handle any errors that occur during data fetching
      print('Error fetching data: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeSidePanel, // Close side panel when tapped outside
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Align(
            // Text "My App"
            alignment: Alignment.centerLeft, // change here to Position the text ' my app'
            child: Text(
              'Smart Square',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              size: 30, // Adjust the size as needed
            ),
            onPressed: toggleSidePanel,
          ),
          actions: [GestureDetector(onTap: (){Navigator.pushNamed(context, loginRoute);},
          child: Icon(Icons.arrow_back_rounded),
          )],
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
                  Center(
                    child: LogoTile(imagePath: 'lib/images/login_logo.png'),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Select one of the following ',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                      // Handle Student login here
                      Navigator.pushNamed(context,teacherAttendancePageRoute);
                    },
                    child: Text(
                      'Attendance',
                      style: TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
                    ),
                  ),
                  Container(
                    width: 71.08,
                    height: 10,
                  ),
                  const SizedBox(height: 30,),
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
                    onPressed: () async {
                       // Fetch the user data from Firestore
                      final userData = await fetchUserData(); // Implement this function to fetch data
                      // Toggle back to the View Page
                      if (userData != null) {
                        // Navigate to the ViewEditUserPage with the fetched data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssignmentPage(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Assignment',
                      style: TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
                    ),
                  ),
                  const SizedBox(height: 30,),
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
                      Navigator.pushNamed(context, teacherMarksHomePageRoute);
                    },
                    child: Text(
                      'Award Marks',
                      style: TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
                    ),
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
            // Side panel (AndroidLarge1)
            if (isSidePanelOpen)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: AndroidLarge1(),
              ),
          ],
        ),
      ),
    );
  }
}

class AndroidLarge1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 250,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Your existing content for the side panel goes here
              Container(
                width: 241,
                height: 800,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFF7EFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 12,
                      height: 10,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            top: 10,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-2.36),
                              child: Container(
                                width: 14.14,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 3,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 2,
                            top: 10,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(-0.79),
                              child: Container(
                                width: 14.14,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 3,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 71.08,
                      height: 71.08,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 14.81,
                            top: 8.88,
                            child: Container(
                              width: 41.46,
                              height: 53.31,
                              child: Stack(children: [
                                // Your stack children here
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 32,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Monda',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      width: 71.08,
                      height: 100,
                    ),
                    SizedBox(
                      width: 143,
                      height: 40,
                      child: Text(
                        'Smart',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Monda',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      width: 71.08,
                      height: 20,
                    ),
                    SizedBox(
                      width: 143,
                      height: 40,
                      child: Text(
                        'Square',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Monda',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 300,),
                    SizedBox(
                      width: 143,
                      height: 40,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, settingsHomePageRoute);
                        },
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Monda',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 143,
                      height: 40,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, faqPageroute);
                        },
                        child: Text(
                          'FAQ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Monda',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 143,
                      height: 40,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, loginRoute);
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Monda',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
