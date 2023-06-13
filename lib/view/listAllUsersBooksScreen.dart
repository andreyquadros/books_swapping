import 'package:book_swapping/view/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Book.dart';
import '../modelview/firebase/book/bookController.dart';
import '../modelview/firebase/book/booksDetailController.dart';
import '../modelview/firebase/book/booksDetailLoans.dart';
import '../modelview/firebase/user/userController.dart';

class ListAllUsersBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final BookController bookController = Get.find();
    final UserController _userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Livros disponíveis'),
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<Book>>(
        future: bookController.listarLivros(email:_userController.user?.email ?? 'contato@clubedoautor.com.br'),
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
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: GestureDetector(
                    onTap: (){

                  final BookDetailsController _bookDetailsController = Get.put(BookDetailsController(livro));

                  Get.to(() => BookDetailsLoans())?.then((value) {

                  _bookDetailsController.cleanController();
                  });

                  },
                      child: Card(
                        color: Colors.white70,
                        child: Column(
                          children: <Widget>[
                            // Primeiro, a imagem de fundo
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/book_template.png'), // caminho para sua imagem
                                  fit: BoxFit.cover,  // isso faz com que a imagem cubra todo o espaço disponível
                                ),
                              ),
                            ),
                            // Em seguida, o ListTile por cima da imagem
                            ListTile(
                              title: Text('${livro.nome}'),
                              subtitle: Text('${livro.emailDono}'),
                              trailing: Icon(Icons.add_box_sharp, color: Colors.deepOrangeAccent,),

                            ),
                          ],
                        ),
                      ),
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
