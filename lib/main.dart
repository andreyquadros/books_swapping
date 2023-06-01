import 'package:book_swapping/view/recoveryPasswordScreen.dart';
import 'package:book_swapping/view/registerScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modelview/firebase/utils/firebase_options.dart';
import 'view/homeScreen.dart';
import 'view/loginScreen.dart';
import 'view/signedScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/recoveryPass', page: () => RecoveryPassScreen()),
        GetPage(name: '/signed', page: () => SignedScreen()),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.green),
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent)))),
      home: HomeScreen()));
}
