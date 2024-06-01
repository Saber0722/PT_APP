import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/pages/navigation_route.dart';

class ViewEditUserPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final String docIdToEdit;

  const ViewEditUserPage({required this.userData, required this.docIdToEdit});

  @override
  State<ViewEditUserPage> createState() => _ViewEditUserPageState();
}

class _ViewEditUserPageState extends State<ViewEditUserPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController roleController;
  late TextEditingController nameController;
  late TextEditingController courseController;
  late TextEditingController emailController;
  late TextEditingController contactController;

  @override
  void initState() {
    super.initState();

    roleController = TextEditingController(text: widget.userData['Role']);
    nameController = TextEditingController(text: widget.userData['Name']);
    courseController = TextEditingController(text: widget.userData['Course']);
    emailController = TextEditingController(text: widget.userData['Email']);
    contactController = TextEditingController(text: widget.userData['Contact']);
  }

  Future<void> updateDataInFirestore(String docId) async {
    try {
      await firestore.collection('Users').doc(docId).update({
        'Role': roleController.text,
        'Name': nameController.text,
        'Email': emailController.text,
        'Course': courseController.text,
        'Contact': contactController.text,
      });
      print('Data updated in Firestore');

      Navigator.of(context).pop(); // Close the editing page
    } catch (e) {
      print('Error updating data in Firestore: $e');
    }
  }

  Future<void> _confirmEdit() async {
    final confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Edit'),
          content: Text('Are you sure you want to edit this data?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User canceled
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User confirmed
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      updateDataInFirestore(widget.docIdToEdit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Role: ${widget.userData['Role']}'),
                    ),
                    ListTile(
                      title: Text('Name: ${widget.userData['Name']}'),
                    ),
                    ListTile(
                      title: Text('Course: ${widget.userData['Course']}'),
                    ),
                    ListTile(
                      title: Text('Email: ${widget.userData['Email']}'),
                    ),
                    ListTile(
                      title: Text('Contact: ${widget.userData['Contact']}'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextField(
                    controller: roleController,
                    decoration: InputDecoration(labelText: 'Role'),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: courseController,
                    decoration: InputDecoration(labelText: 'Course'),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email ID'),
                  ),
                  TextField(
                    controller: contactController,
                    decoration: InputDecoration(labelText: 'Contact Number'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _confirmEdit,
                child: Text('Save'),
              ),
            ],
          ),
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
