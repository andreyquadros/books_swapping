import 'package:book_swapping/view/components/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../modelview/firebase/user/deslogarFirebase.dart';

class SignedScreen extends StatefulWidget {
  const SignedScreen({Key? key}) : super(key: key);

  @override
  State<SignedScreen> createState() => _SignedScreenState();
}

class _SignedScreenState extends State<SignedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Logada'),
        actions: [
          GestureDetector(onTap: deslogarFirebase, child: Icon(Icons.logout)),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
