import 'package:book_swapping/view/components/messages/customMaterialBanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> atualizarUsuarioAuthFirebase(
    context, String email, String displayName) async {
  final user = await FirebaseAuth.instance.currentUser;
  if (user != null) {
    user.updateDisplayName(displayName);
    user.updateEmail(email);
    customMaterialBanner(
        context, 'Dados Atualizados com Sucesso!', Colors.green);
  }
}
