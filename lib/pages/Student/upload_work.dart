import 'package:modernlogintute/pages/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modernlogintute/pages/Student/student_home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadAndViewDocument(),
    );
  }
}

class UploadAndViewDocument extends StatefulWidget {
  @override
  _UploadAndViewDocumentState createState() => _UploadAndViewDocumentState();
}

class _UploadAndViewDocumentState extends State<UploadAndViewDocument> {
  File? _uploadedFile;
  String? _downloadUrl;

  // Function to pick a document for upload
  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        _uploadedFile = File(result.files.single.path!);
      });
    }
  }

  // Function to upload the picked document to Firebase Storage
  Future<void> _uploadDocument() async {
  if (_uploadedFile != null) {
    try {
      final String fileName = 'document_${DateTime.now()}.pdf'; // Unique file name
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('documents/$fileName');

      // Upload the file
      final UploadTask uploadTask = storageReference.putFile(_uploadedFile!);

      // Get the completed upload task
      await uploadTask.whenComplete(() async {
        final String downloadURL = await storageReference.getDownloadURL();
        
        setState(() {
          _downloadUrl = downloadURL;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Document uploaded successfully')),
        );
      });
    } catch (e) {
      print('Error uploading document: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading document')),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No document selected')),
    );
  }
  Navigator.push(context,MaterialPageRoute(builder:   (context)=>StudentHomePage(Mail:  '')));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload and View Document'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_uploadedFile != null)
              Text('Document Selected: ${_uploadedFile!.path}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickDocument,
              child: Text('Pick Document'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadDocument,
              child: Text('Upload Document'),
            ),
            SizedBox(height: 20),
          ],
        )
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
