import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modernlogintute/pages/navigation_route.dart';

class EditStudentPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final String docIdToEdit;

  const EditStudentPage({required this.userData, required this.docIdToEdit});

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController engController;
  late TextEditingController nameController;
  late TextEditingController sectionController;
  late TextEditingController chemController;
  late TextEditingController ctpsController;
  late TextEditingController dmController;
  late TextEditingController emController;

  @override
  void initState() {
    super.initState();

    engController = TextEditingController(text: widget.userData['English']);
    nameController = TextEditingController(text: widget.userData['Name']);
    sectionController = TextEditingController(text: widget.userData['Section']);
    chemController = TextEditingController(text: widget.userData['Chemistry']);
    ctpsController = TextEditingController(text: widget.userData['Computational Thinking and Problem Solving']);
    dmController = TextEditingController(text: widget.userData['Discrete Math']);
    emController = TextEditingController(text: widget.userData['Engineering Math']);
  }

  Future<void> updateDataInFirestore(String documentId) async {
    try {
      await firestore.collection('Teacher_Attendance').doc(documentId).update({
        'English': engController.text,
        'Name': nameController.text,
        'Chemistry': chemController.text,
        'Section': sectionController.text,
        'Computational Thinking and Problem Solving': ctpsController.text,
        'Discrete Math': dmController.text,
        'Engineering Math': emController.text,
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
        title: Text('Edit Student'),
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
                      title: Text('Name: ${widget.userData['Name']}'),
                    ),
                    ListTile(
                      title: Text('Section: ${widget.userData['Section']}'),
                    ),
                    ListTile(
                      title: Text('English: ${widget.userData['English']}'),
                    ),
                    ListTile(
                      title: Text('Discrete Math: ${widget.userData['Discrete Math']}'),
                    ),
                    ListTile(
                      title: Text('Engineering Math: ${widget.userData['Engineering Math']}'),
                    ),
                    ListTile(
                      title: Text('Chemistry: ${widget.userData['Chemistry']}'),
                    ),
                    ListTile(
                      title: Text('Computational Thinking and Problem Solving: ${widget.userData['Computational Thinking and Problem Solving']}'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: sectionController,
                    decoration: InputDecoration(labelText: 'Section'),
                  ),
                  TextField(
                    controller: engController,
                    decoration: InputDecoration(labelText: 'English'),
                  ),
                  TextField(
                    controller: dmController,
                    decoration: InputDecoration(labelText: 'Discrete Math'),
                  ),
                  TextField(
                    controller: emController,
                    decoration: InputDecoration(labelText: 'Engineering Math'),
                  ),
                  TextField(
                    controller: chemController,
                    decoration: InputDecoration(labelText: 'Chemistry'),
                  ),
                  TextField(
                    controller: ctpsController,
                    decoration: InputDecoration(labelText: 'Computational Thinking and Problem Solving Number'),
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
