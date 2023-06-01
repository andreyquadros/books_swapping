import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../view/components/messages/customMaterialBanner.dart';

Future<void> cadastrarUsuarioFirebase(
    context, String emailAddress, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    customMaterialBanner(
        context, 'Conta Cadastrada com Sucesso!', Colors.green);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print(e.code);
      customMaterialBanner(context, 'Erro - Senha Fraca!', Colors.red);
    } else if (e.code == 'email-already-in-use') {
      print(e.code);
      customMaterialBanner(context, 'Erro - E-mail em uso!', Colors.red);
    }
  } catch (e) {
    print(e);
    customMaterialBanner(context, 'Erro - Desconhecido', Colors.red);
  }
}
