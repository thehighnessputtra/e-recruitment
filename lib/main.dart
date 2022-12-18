import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/firebase_options.dart';
import 'package:latihan_firebase/pages/on_boarding.dart';
import 'package:latihan_firebase/pages/splashscreen.dart';
import 'package:latihan_firebase/view_model/job_profile_view_model.dart';
import 'package:latihan_firebase/view_model/news_api_view_model.dart';
import 'package:provider/provider.dart';

import 'pages/login_regist/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobProfileViewModel(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
              useMaterial3: true,
              fontFamily: "FontLato",
              appBarTheme:
                  const AppBarTheme(backgroundColor: Colors.transparent)),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const SplashScreen();
                } else {
                  return const OnboardingScreen();
                }
              })),
    );
  }
}
