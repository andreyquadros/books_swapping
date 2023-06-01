import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<void> deslogarFirebase() async {
  await FirebaseAuth.instance.signOut();
  Get.offAllNamed('/login');
}
