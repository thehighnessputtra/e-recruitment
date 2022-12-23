import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/firebase_options.dart';
import 'package:latihan_firebase/pages/splashscreen/splashscreen.dart';
import 'package:latihan_firebase/services/firebase_service.dart';
import 'package:latihan_firebase/view_model/job_profile_view_model.dart';
import 'package:latihan_firebase/view_model/news_api_view_model.dart';
import 'package:provider/provider.dart';

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
          Provider<FirebaseService>(
            create: (context) => FirebaseService(FirebaseAuth.instance),
          ),
          ChangeNotifierProvider(
            create: (context) => NewsAPIViewModel(),
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
            home: const SplashScreen())
        // StreamBuilder<User?>(
        //     stream: FirebaseAuth.instance.userChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return const SplashScreen();
        //       } else {
        //         return const OnboardingScreen();
        //       }
        //     })),
        );
  }
}
