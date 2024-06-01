import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
import 'package:modernlogintute/pages/side_panel.dart/settings.dart/settings_home_page.dart';

class AppRatingPage extends StatefulWidget {
  @override
  _AppRatingPageState createState() => _AppRatingPageState();
}

class _AppRatingPageState extends State<AppRatingPage> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate This App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "How would you rate our app?",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the user's rating and feedback here
                if (rating >= 3.0) {
                  // Handle high ratings (e.g., save the rating and thank the user)
                  // You can customize this based on your app's requirements.
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Thank You!"),
                        content: Text("We appreciate your positive feedback."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context)=>SettingsHomePage())
                              );
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Feedback"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("We're sorry to hear that. Please provide your feedback:"),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: "Feedback",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              // Handle the feedback (e.g., send it to your server)
                              // You can customize this based on your app's requirements.
                              Navigator.of(context).pop();
                            },
                            child: Text("Submit"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("Submit Rating"),
            ),
          ],
        ),
      ),
    );
  }
}
