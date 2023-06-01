import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../view/components/messages/customMaterialBanner.dart';

Future<void> esqueceuSenhaFirebase(context, String emailAddress) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
  customMaterialBanner(context, 'E-mail de Recuperação Enviado!', Colors.red);
}
