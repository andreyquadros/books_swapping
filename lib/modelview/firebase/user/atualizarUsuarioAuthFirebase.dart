import 'package:firebase_auth/firebase_auth.dart';

Future<void> atualizarUsuarioAuthFirebase(
    String email, String displayName) async {
  final user = await FirebaseAuth.instance.currentUser;
  if (user != null) {
    user.updateDisplayName(displayName);
  }
}
