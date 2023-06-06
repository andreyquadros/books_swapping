import 'package:book_swapping/view/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Book.dart';
import '../modelview/firebase/user/bookController.dart';

class ListAllUsersBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final BookController bookController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Livros disponíveis'),
      ),
      drawer: CustomDrawer(),
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
                  child: Stack(
                    children: <Widget>[
                      // Primeiro, a imagem de fundo
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/book_template.png'), // caminho para sua imagem
                            fit: BoxFit.cover,  // isso faz com que a imagem cubra todo o espaço disponível
                          ),
                        ),
                      ),
                      // Em seguida, o ListTile por cima da imagem
                      ListTile(
                        title: Text('Nome do Livro: ${livro.nome} - ISBN: ${livro.isbn} - Dono do Livro: ${livro.emailDono}'),
                        subtitle: Text(livro.sinopse, maxLines: 2, overflow: TextOverflow.ellipsis,),

                      ),
                    ],
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
