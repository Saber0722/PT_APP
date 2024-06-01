
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
class AddUsersPage extends StatefulWidget {
  const AddUsersPage();

  @override
  State<AddUsersPage> createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {



  // Initialize Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isEditing=false;
  String docIdToEdit='';

  final TextEditingController RoleController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController CourseController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController ContactController = TextEditingController();

// Function to edit data
Future<void> updateDataInFirestore(String docId) async {
    try {
      await firestore.collection('Users').doc(docId).update({
        'Role':RoleController.text,
        'Name':NameController.text,
        'Email':EmailController.text,
        'Course':CourseController.text,
        'Contact': ContactController.text,
      });
      print('Data updated in Firestore');

      // Reset editing state
      setState(() {
        isEditing = false;
        docIdToEdit = '';
      });
    } catch (e) {
      print('Error updating data in Firestore: $e');
    }
  }




  // Function to add data to Firestore
  Future<void> addDataToFirestore() async {
    try {
      await firestore.collection('Users').add({
        'Role': RoleController.text,
        'Name': NameController.text,
        'Course': CourseController.text,
        'Email': EmailController.text,
        'Contact': ContactController.text,
      });
      RoleController.text = '';
      NameController.text = '';
      EmailController.text = '';
      CourseController.text = '';
      ContactController.text = '';
      print('Data added to Firestore');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }
          // title
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column( children: [

              // Role Field
                  TextField(
                    controller: RoleController,
                    decoration: InputDecoration(labelText: 'Role'),
                  ),

                  // Name Field
                  TextField(
                    controller: NameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),

                  // Course Field
                  TextField(
                    controller: CourseController,
                    decoration: InputDecoration(labelText: 'Course'),
                  ),

                  // Email Field
                  TextField(
                    controller: EmailController,
                    decoration: InputDecoration(labelText: 'Email ID'),
                  ),

                  // Contact Field 
                  TextField(
                    controller: ContactController,
                    decoration: InputDecoration(labelText: 'Contact Number'),
                  ),
            ],),
      ElevatedButton(
                  onPressed: () {
                    // Add Data to Database
                    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm New User?'),
          content: Text('Are you sure you want to add this data?'),
          actions: <Widget>[
            // Cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('cancel'),
            ),
            // Confirm button
            TextButton(
              onPressed: () async {
                // Perform the data addition
                updateDataInFirestore('');
                    addDataToFirestore();
                   setState(() {
                      RoleController.text='';
                      NameController.text='';
                      CourseController.text = '';
                      EmailController.text='';
                      ContactController.text = '';
                    });
                // Close the dialog
                Navigator.of(context).pop();
                Navigator.pushNamed(context,adminHomePageRoute);

                // Show a success message 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Data Added successfully!'),
                    
                  ),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
                    
                  },
                  child: Text('Save'),
                ),
        
                    // Firestore data
          ],
      ),
    ),
    ),
    );
}
}
// side panel
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
              // content
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
                      height: 200,
                      
                    ),

                    SizedBox(
                      
                      width: 143,
                      height: 40,
                        child:Text(
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
                        child:Text(
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
                   
                    Container(
                      width: 36,
                      height: 36,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20.55,
                            top: 16.16,
                            child: Container(
                              width: 6.85,
                              height: 6.85,
                              child: Stack(children: [
                                // Your stack children here
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 37,
                      height: 373,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 37,
                              height: 304,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 1,
                                    top: 79,
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      child: Stack(children: [
                                        // Your stack children here
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                   
                    SizedBox(
                      
                      width: 143,
                      height: 40,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, settingsHomePageRoute);
                        },
                        child:Text(
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
                     SizedBox(
                      
                      width: 143,
                      height: 40,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, loginRoute);
                        },
                        child:Text(
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
