import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vet_student/firebase_options.dart';
import 'package:vet_student/tools/locator.dart';
import 'package:vet_student/tools/routes.dart';
import 'package:vet_student/view/splash_page.dart';
import 'package:vet_student/view_model/splash_view_model.dart';


import 'generated/l10n.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await _setupFirebase();
  runApp(const MyApp());
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: ChangeNotifierProvider(
        create: (context) => SplashViewModel(),
        child:  SplashPage(),
      ),
      routes: Routes.getRoutes(),
    );
  }
}
