import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/pages/navigation_route.dart';

class DeleteStudentMarksPage extends StatefulWidget {
  @override
  _DeleteStudentMarksPageState createState() => _DeleteStudentMarksPageState();
}

class _DeleteStudentMarksPageState extends State<DeleteStudentMarksPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Data'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestore.collection('Teacher_Marks').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final QuerySnapshot<Map<String, dynamic>> documents = snapshot.data!;

          if (documents.docs.isEmpty) {
            return Center(child: Text('No students available.'));
          }

          return ListView.builder(
            itemCount: documents.docs.length,
            itemBuilder: (context, index) {
              final data = documents.docs[index].data() as Map<String, dynamic>;
              final documentId = documents.docs[index].id;

              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text('Name: ${data['Name']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Section: ${data['Section']}'),
                      Text('English: ${data['English']}'),
                      Text('Discrete Math: ${data['Discrete Math']}'),
                      Text('Engineering Math: ${data['Engineering Math']}'),
                      Text('Chemistry: ${data['Chemistry']}'),
                      Text('Computational Thinking and Problem Solving: ${data['Computational Thinking and Problem Solving']}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Show the confirmation dialog and pass the document ID
                      _showDeleteConfirmationDialog(documentId);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Function to show a confirmation dialog and delete a specific document
  Future<void> _showDeleteConfirmationDialog(String documentId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this data?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Delete the specific document from Firestore
                await firestore.collection('Teacher_Marks').doc(documentId).delete();
                // Close the dialog
                Navigator.of(context).pop();
                // Show a snackbar to indicate successful deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Data deleted successfully!'),
                  ),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
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
