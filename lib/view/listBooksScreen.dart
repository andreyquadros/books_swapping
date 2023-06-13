import 'package:book_swapping/modelview/firebase/book/booksDetailController.dart';
import 'package:book_swapping/view/bookDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Book.dart';
import '../modelview/firebase/book/bookController.dart';
import '../modelview/firebase/user/userController.dart';

class ListBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final BookController _bookController = Get.find();
    final UserController _userController = Get.put(UserController());


    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: FutureBuilder<List<Book>>(
        future: _bookController.listarLivrosAuth(email:_userController.user?.email ?? 'contato@clubedoautor.com.br'),
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
                return GestureDetector(
                  onTap: (){

                    final BookDetailsController _bookDetailsController = Get.put(BookDetailsController(livro));

                    Get.to(() => BookDetailsScreen())?.then((value) {

                      _bookDetailsController.cleanController();
                    });

                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('${livro.capa}'),
                      ),
                      title: Text('Nome do Livro: ${livro.nome} - ISBN: ${livro.isbn}'),
                      subtitle: Text(livro.sinopse, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ),
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
