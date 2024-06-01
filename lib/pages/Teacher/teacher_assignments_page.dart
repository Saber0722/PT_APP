import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
class AssignmentPage extends StatefulWidget {
  const AssignmentPage();

  @override
  State<AssignmentPage> createState() => AssignmentPageState();
}

class AssignmentPageState extends State<AssignmentPage> {



  // Initialize Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isEditing=false;
  String docIdToEdit='';
  // TextEditingController for input fields
  final TextEditingController subController = TextEditingController();
  final TextEditingController q1Controller = TextEditingController();
  final TextEditingController q2Controller = TextEditingController();
  final TextEditingController q3Controller = TextEditingController();
  final TextEditingController q4Controller = TextEditingController();
  final TextEditingController q5Controller = TextEditingController();

 

// Function to save data
Future<void> updateDataInFirestore(String Assignment) async {
    try {
      await firestore.collection('Teacher').doc('Assignment').update({
        'Subject':subController.text,
        'Question 1':q1Controller.text,
        'Question 2':q2Controller.text,
        'Question 3':q3Controller.text,
        'Question 4': q4Controller.text,
        'Question 5':q5Controller.text,
        
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
  Future<void> addDataToFirestore(String Marks) async {
    try {
      await firestore.collection('Teacher').doc('Assignment').set({
        'Subject':subController.text,
        'Question 1':q1Controller.text,
        'Question 2':q2Controller.text,
        'Question 3':q3Controller.text,
        'Question 4': q4Controller.text,
        'Question 5':q5Controller.text,
      });
      subController.text = '';
      q1Controller.text = '';
      q2Controller.text = '';
      q3Controller.text = '';
      q4Controller.text = '';
      q5Controller.text='';
      print('Data added to Firestore');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Assignment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column( children: [

              // Name Field
                  TextField(
                    controller: subController,
                    decoration: InputDecoration(labelText: 'Subject'),
                  ),

                  // Section Field
                  TextField(
                    controller: q1Controller,
                    decoration: InputDecoration(labelText: 'Question 1'),
                  ),

                  // English Field
                  TextField(
                    controller: q2Controller,
                    decoration: InputDecoration(labelText: 'Question 2'),
                  ),

                  // Engineering Math Field
                  TextField(
                    controller: q3Controller,
                    decoration: InputDecoration(labelText: 'Question 3'),
                  ),

                  // Discrete Math Field 
                  TextField(
                    controller: q4Controller,
                    decoration: InputDecoration(labelText: 'Question 4'),
                  ),
                  TextField(
                    controller: q5Controller,
                    decoration: InputDecoration(labelText: 'Question 5'),
                  ),
            ],),
      ElevatedButton(
                  onPressed: () {

                    // Add Data to Database
                    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Upload?'),
          content: Text('Are you sure you want to upload this assignment?'),
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
                // Perform the data addition here
                updateDataInFirestore('');
                    addDataToFirestore('');
                   setState(() {
                      subController.text='';
                      q1Controller.text='';
                      q2Controller.text = '';
                      q3Controller.text='';
                      q4Controller.text = '';
                      q5Controller.text='';
                    });
                // Close the dialog
                Navigator.of(context).pop();
                Navigator.pushNamed(context,teacherHomePageRoute);

                // Show a success message or navigate to a different page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Assignment Uploaded successfully!'),
                    
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
