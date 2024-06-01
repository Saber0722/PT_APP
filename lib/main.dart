import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/Student/student_home_page.dart';
import 'package:modernlogintute/pages/Student/upload_work.dart';
import 'package:modernlogintute/pages/Student/view_assignments_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_attendance.dart/add_student_attendance_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_attendance.dart/delete_student_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_attendance.dart/teacher_attendance_home_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_attendance.dart/view_attendance_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_award_marks.dart/add_student_marks_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_award_marks.dart/delete_student_marks_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_award_marks.dart/teacher_marks_home_page.dart';
import 'package:modernlogintute/pages/admin/admin_add_page.dart';
import 'package:modernlogintute/pages/admin/admin_delete_page.dart';
import 'package:modernlogintute/pages/admin/admin_home_page.dart';
import 'package:modernlogintute/pages/admin/admin_view_all_users_page.dart';
import 'package:modernlogintute/pages/auth_page.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modernlogintute/pages/login_role.dart';
import 'package:modernlogintute/pages/register_page.dart';
import 'package:modernlogintute/pages/side_panel.dart/settings.dart/complaint.dart';
import 'package:modernlogintute/pages/side_panel.dart/settings.dart/faq_page.dart';
import 'package:modernlogintute/pages/side_panel.dart/settings.dart/privacy_policy.dart';
import 'package:modernlogintute/pages/side_panel.dart/settings.dart/rating.dart';
import 'package:modernlogintute/pages/side_panel.dart/settings.dart/settings_home_page.dart';
import 'package:modernlogintute/services/firebase_options.dart';
import 'package:modernlogintute/pages/navigation_route.dart';
import 'package:modernlogintute/pages/Teacher/teacher_home_page.dart';
import 'package:modernlogintute/pages/Teacher/teacher_award_marks.dart/view_student_marks_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: rolePageRoute ,// Set your initial route here
      routes: {
        '/': (context) => RolePage(), 
        //  Initial route (RolePage)
        rolePageRoute: (context)=>RolePage(),
        loginRoute: (context) => LoginPage(onTap: (){},role:''),
        homeRoute: (context) => HomePage(),
        authRoute: (context) => AuthPage(),
        registerPageRoute:(context)=> RegisterPage(onTap: (){}),
        loginorRegisterPageRoute:(context)=> LoginOrRegisterPage(),


       // Admin Routes
        adminHomePageRoute: (context)=> AdminPage(),
        adminAddUserPageRoute:(context)=>AddUsersPage(),
        adminDeletePageRoute:(context)=> DeleteDataPage(),
        adminViewAllUserPageRoute:(context)=> ViewAllUsersPage(),
       

       // Teacher Home Page
       teacherHomePageRoute:(context)=> TeacherHomePage(),

       // Teacher Attendance Routes
        
        teacherAttendancePageRoute:(context)=> TeacherAttendancePage(),
        viewAttendancePageRoute:(context)=>ViewAttendancePage(),
        addStudentAttendancePageRoute:(context)=>AddStudentPage(),
        deleteStudentAttendancePageRoute:(context)=>DeleteStudentDataPage(),
        

        // Teacher Marks Routes
        teacherMarksHomePageRoute:(context)=>TeacherMarksHomePage(),
        teacherViewMarksPageRoute:(context)=>ViewMarksPage(),
        teacherAddStudentMarksPageRoute:(context)=>AddStudentMarksPage(),
        teacherDeleteStudentMarksPageRoute:(context)=>DeleteStudentMarksPage(),

       // Side Panel Routes
       complaintpageroute:(context)=>ComplaintPage(),
       apprRatingPageRoute:(context)=>AppRatingPage(),
       settingsHomePageRoute:(context)=>SettingsHomePage(),
       privacyPolicyPageRoute:(context)=>PrivacyPolicyPage(),
       faqPageroute:(context)=>FAQPage(),

      // Student Page Routes
      uploadWorkPageRoute:(context)=>UploadAndViewDocument(),
      viewAssignmentPageRoute:(context)=>ViewAssignmentPage(),

             },
    );
  }
}
