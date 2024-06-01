import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Effective Date: 07-10-2023",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "1. Introduction",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "This Privacy Policy describes how we collect, use, and disclose your personal information when you use our mobile application.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text(
                "2. Information We Collect",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We may collect information that you provide directly to us, such as your name, email address, and any other information you choose to provide.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text(
                "3. How We Use Your Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We may use your personal information to:",
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8),
              Text(
                "- Provide, maintain, and improve our services.",
                textAlign: TextAlign.justify,
              ),
              Text(
                "- Respond to your comments, questions, and requests.",
                textAlign: TextAlign.justify,
              ),
              // Add more usage descriptions as needed
              SizedBox(height: 16),
              Text(
                "4. Disclosure of Your Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We may share your personal information with third parties only in the ways described in this Privacy Policy.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text(
                "5. Your Choices",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "You have the right to access personal information we hold about you and to ask that your personal information be corrected, updated, or deleted. If you would like to exercise this right, please contact us.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Text(
                "6. Contact Us",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions about this Privacy Policy, please contact us at '+91-1234567890.'",
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
