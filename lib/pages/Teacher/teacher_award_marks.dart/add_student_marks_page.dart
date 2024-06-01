import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/pages/Teacher/teacher_award_marks.dart/view_student_marks_page.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
class AddStudentMarksPage extends StatefulWidget {
  const AddStudentMarksPage();

  @override
  State<AddStudentMarksPage> createState() => _AddStudentMarksPageState();
}

class _AddStudentMarksPageState extends State<AddStudentMarksPage> {



  // Initialize Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isEditing=false;
  String docIdToEdit='';
  // TextEditingController for input fields
  final TextEditingController englishController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController emController = TextEditingController();
  final TextEditingController dmController = TextEditingController();
  final TextEditingController chemController = TextEditingController();
final TextEditingController ctpsController = TextEditingController();
 

// Function to save data
Future<void> updateDataInFirestore(String documentId) async {
  try {
    await firestore.collection('Teacher_Marks').doc(documentId).update({
      'English': englishController.text,
      'Name': nameController.text,
      'Engineering Math': emController.text,
      'Section': sectionController.text,
      'Discrete Math': dmController.text,
      'Chemistry': chemController.text,
      'Computational Thinking and Problem Solving': ctpsController.text,
    });
    print('Data updated in Firestore for document ID: $documentId');

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
    final CollectionReference teacherCollection = firestore.collection('Teacher_Marks');
    DocumentReference documentReference = teacherCollection.doc(); // Generate a new document ID

    await documentReference.set({
      'English': englishController.text,
      'Name': nameController.text,
      'Section': sectionController.text,
      'Engineering Math': emController.text,
      'Discrete Math': dmController.text,
      'Chemistry': chemController.text,
      'Computational Thinking and Problem Solving': ctpsController.text,
    });

    // Clear the text fields
    englishController.text = '';
    nameController.text = '';
    emController.text = '';
    sectionController.text = '';
    dmController.text = '';
    chemController.text = '';
    ctpsController.text = '';

    print('Data added to Firestore with document ID: ${documentReference.id}');
  } catch (e) {
    print('Error adding data to Firestore: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column( children: [

              // Name Field
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),

                  // Section Field
                  TextField(
                    controller: sectionController,
                    decoration: InputDecoration(labelText: 'Section'),
                  ),

                  // English Field
                  TextField(
                    controller: englishController,
                    decoration: InputDecoration(labelText: 'English'),
                  ),

                  // Engineering Math Field
                  TextField(
                    controller: emController,
                    decoration: InputDecoration(labelText: 'Engineering Math'),
                  ),

                  // Discrete Math Field 
                  TextField(
                    controller: dmController,
                    decoration: InputDecoration(labelText: 'Discrete Math'),
                  ),

                  // Chemistry Field
                  TextField(
                    controller: chemController,
                    decoration: InputDecoration(labelText: 'Chemistry'),
                  ),

                  // CTPS Field
                  TextField(
                    controller: ctpsController,
                    decoration: InputDecoration(labelText: 'Computational Thinking and Problem Solving'),
                    
                  ),
            ],),
      ElevatedButton(
                  onPressed: () {

                    // Add Data to Database
                    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm New Student?'),
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
                // Perform the data addition here
                updateDataInFirestore('');
                    addDataToFirestore();
                   setState(() {
                      englishController.text='';
                      nameController.text='';
                      sectionController.text = '';
                      emController.text='';
                      dmController.text = '';
                      chemController.text='';
                      ctpsController.text='';
                    });
                // Close the dialog
                Navigator.of(context).pop();
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ViewMarksPage()));

                // Show a success message or navigate to a different page
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
