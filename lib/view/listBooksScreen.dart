import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Book.dart';
import '../modelview/firebase/user/bookController.dart';

class ListBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final BookController bookController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: FutureBuilder<List<Book>>(
        future: bookController.listarLivros(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar livros: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Book livro = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage('${livro.capa}'),
                    ),
                    title: Text('Nome do Livro: ${livro.nome} - ISBN: ${livro.isbn}'),
                    subtitle: Text(livro.sinopse, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
