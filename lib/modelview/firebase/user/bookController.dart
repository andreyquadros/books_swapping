import 'dart:io';
import 'package:book_swapping/view/components/messages/customMaterialBanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Book.dart';


class BookController extends GetxController {
  File? file;

  Future<FilePickerResult?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null && result.files.isNotEmpty) {
      final fileBytes = result.files.first.bytes;
      final fileName = result.files.first.name;
      update();
      return result;
      // Atualiza a UI
    }
    if (result == null) {
      print('Nenhum arquivo selecionado');
    }
    return result;
  }

  Future<String> uploadFile(file) async {
    String downloadURL = '';
    if (file == null) {
      return 'Arquivo está vazio!';
    }

    try {
      // Crie uma referência ao local do arquivo no Firebase Storage.
      // Você pode ajustar o caminho conforme suas necessidades.
      var storageReference = FirebaseStorage.instance
          .ref()
          .child('capasLivros/${file!.files.first.name}');

      // Faz o upload do arquivo para o Firebase Storage
      await storageReference.putData(file!.files.first.bytes);

      // Se você quiser obter a URL do arquivo após o upload, você pode usar o seguinte código:
      downloadURL = await storageReference.getDownloadURL();
    } catch (e) {
      // Lidar com erros
      print('Erro ao fazer upload do arquivo: $e');
    }
    return downloadURL;
  }

  Future<void> salvarLivro(context, livro) async {
    if (livro == null) {
      return;
    }

    CollectionReference livros =
    FirebaseFirestore.instance.collection('livros');

    try {
      await livros.add(livro!.toMap());
      customMaterialBanner(
          context, 'Livro Cadastrado com Sucesso', Colors.green);
    } catch (e) {
      print('Erro ao adicionar livro: $e');
    }
  }

  Future<List<Book>> listarLivros() async {
    CollectionReference livros = FirebaseFirestore.instance.collection(
        'livros');

    QuerySnapshot querySnapshot = await livros.get();
    return querySnapshot.docs.map((doc) {
      return Book.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
