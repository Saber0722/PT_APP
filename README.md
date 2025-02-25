# SmartSquare

**SmartSquare** is a mobile application designed to empower parents by providing them with real-time access to their children's academic activities, including attendance, marks, and other important updates. Built using Flutter, Dart, JavaScript, and Google Firebase, SmartSquare ensures seamless communication between schools and parents.

---

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [How to Run the App](#how-to-run-the-app)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Features

SmartSquare offers the following key functionalities:

- **Attendance Tracking**: Parents can view their child's daily and monthly attendance records.
- **Marks and Grades**: Access detailed reports of exams, assignments, and overall performance.
- **Notifications**: Real-time alerts for important announcements, events, or updates from the school.
- **Secure Authentication**: User authentication powered by Firebase to ensure data security.
- **Cross-Platform Support**: Available on both Android and iOS devices.
- **User-Friendly Interface**: Simple and Intuitive design for easy navigation for parents of all age groups.

---

## Technologies Used

- **Flutter**: Cross-platform framework for building the app's UI.
- **Dart**: Programming language used for app logic and functionality.
- **JavaScript**: Used for additional scripting and backend integrations.
- **Google Firebase**:
  - Firebase Authentication: For secure user login and registration.
  - Firestore Database: To store and manage attendance, marks, and other data.
  - Firebase Cloud Messaging (FCM): For push notifications.
- **GitHub**: Version control and collaboration platform.

---

## Setup Instructions

### Prerequisites

Before you begin, ensure you have the following installed on your system:

1. **Flutter SDK**: Install Flutter by following the official guide [here](https://flutter.dev/docs/get-started/install).
2. **Dart**: Comes bundled with the Flutter SDK.
3. **Node.js**: Required for JavaScript dependencies. Download it [here](https://nodejs.org/).
4. **Firebase CLI**: Install Firebase tools globally using npm:
   ```bash
   npm install -g firebase-tools
   ```
5. **Android Studio / Xcode**: For running the app on Android/iOS emulators or physical devices.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Saber0722/PT_APP.git
   cd PT_APP
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up Firebase:
   - Create a new Firebase project in the [Firebase Console](https://console.firebase.google.com/).
   - Add an Android and/or iOS app to your Firebase project.
   - Download the `google-services.json` (for Android) and/or `GoogleService-Info.plist` (for iOS) file and place it in the respective directories:
     - Android: `android/app/`
     - iOS: `ios/Runner/`
   - Enable Firebase Authentication, Firestore, and Cloud Messaging in your Firebase project.

4. Configure environment variables:
   - Create a `.env` file in the root directory and add your Firebase configuration details:
     ```env
     FIREBASE_API_KEY=your_api_key
     FIREBASE_AUTH_DOMAIN=your_auth_domain
     FIREBASE_PROJECT_ID=your_project_id
     FIREBASE_STORAGE_BUCKET=your_storage_bucket
     FIREBASE_MESSAGING_SENDER_ID=your_sender_id
     FIREBASE_APP_ID=your_app_id
     ```

5. Build the app:
   ```bash
   flutter build apk # For Android
   flutter build ios # For iOS
   ```

---

## How to Run the App

1. Connect a physical device or start an emulator:
   - For Android:
     ```bash
     flutter emulators --launch <emulator_name>
     ```
   - For iOS:
     ```bash
     open -a Simulator
     ```

2. Run the app:
   ```bash
   flutter run
   ```

3. The app should now launch on your device/emulator. Log in using your credentials or sign up as a new user.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact

For any questions, feedback, or support, feel free to reach out:

- **Developer**: Saber
- **Email**: [c.aakash.dev@gmail.com] <!-- Replace with your email -->
- **GitHub**: [@Saber0722](https://github.com/Saber0722)

---

Thank you for using **SmartSquare**! We hope this app helps parents stay connected with their children's academic journey.

---
