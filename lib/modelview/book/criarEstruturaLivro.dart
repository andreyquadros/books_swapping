import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../view/components/messages/customMaterialBanner.dart';
import '../../model/Book.dart';

Future<Book> criarLivro(context, String nome, String emailDono, String sinopse,
    String ISBN, String urlCapaLivro) async {
  var livro = Book(
      nome: '${nome}',
      emailDono: '${emailDono}',
      sinopse: '${sinopse}',
      isbn: '${ISBN}',
      capa: '${urlCapaLivro}');
  return livro;
}
