import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  TextEditingController complaintController = TextEditingController();

  @override
  void dispose() {
    complaintController.dispose();
    super.dispose();
  }

  void _submitComplaint() {
    // You can implement the code to submit the complaint here
    String complaintText = complaintController.text;
    // Add your logic to send the complaint to the server or process it as needed.
    print('Complaint submitted: $complaintText');
    // You can also show a confirmation dialog or navigate to a different page.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please enter your complaint:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: complaintController,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Type your complaint here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitComplaint,
              child: Text('Submit Complaint'),
            ),
          ],
        ),
      ),
    );
  }
}
