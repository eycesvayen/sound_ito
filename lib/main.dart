//import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sound_ito/firebase_options.dart';
import 'package:sound_ito/models/login_page_model.dart';
import 'package:sound_ito/models/playlist_provider.dart';
import 'package:sound_ito/pages/auth_gate.dart';
//import 'package:sound_ito/pages/home_page.dart';
//import 'package:sound_ito/pages/login_page.dart';
import 'package:sound_ito/themes/theme_provider.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (context) => ThemeProvider()),
//       ChangeNotifierProvider(create: (context) => PlaylistProvider()),
//     ],
//     child: const MyApp(),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => PlaylistProvider()),
    ChangeNotifierProvider(create: (_) => LoginPageModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      title: 'Sound-ITO',
      //theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
