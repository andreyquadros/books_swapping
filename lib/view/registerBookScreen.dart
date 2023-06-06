import 'package:book_swapping/modelview/book/criarEstruturaLivro.dart';
import 'package:book_swapping/modelview/firebase/user/atualizarUsuarioAuthFirebase.dart';
import 'package:book_swapping/view/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/Book.dart';
import '../modelview/firebase/user/bookController.dart';
import '../modelview/firebase/user/userController.dart';


class RegisterBookScreen extends StatefulWidget {
  @override
  _RegisterBookScreenState createState() => _RegisterBookScreenState();
}

class _RegisterBookScreenState extends State<RegisterBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ISBNController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();

  final BookController bookController = Get.put(BookController());
  final UserController _userController = Get.put(UserController());

  late final capa;
  late final urlCapa;
  late final Book livro;

  @override
  void dispose() {
    _nameController.dispose();
    _ISBNController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Livro'),
      ),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 30, 32, 10),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Título do Livro', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do Livro';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
              child: TextFormField(
                controller: _ISBNController,
                decoration: InputDecoration(labelText: 'ISBN', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu ISBN';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
              child: TextFormField(
                controller: _sinopseController,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Sinopse', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a sua Sinopse';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  capa = await bookController.pickFile();
                  print(capa.files.first.bytes);
                }
              },
              child: Text('Selecionar Capa'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  urlCapa = await bookController.uploadFile(capa);
                  print(urlCapa);
                   livro = await criarLivro(context, _nameController.text,_userController.user?.email ?? 'contato@clubedoslivros.com.br', _sinopseController.text , _ISBNController.text, urlCapa);
                   print(livro.nome);
                   await bookController.salvarLivro(context, livro);
                }
              },
              child: Text('Cadastrar Livro'),
            ),
          ],
        ),
      ),
    );
  }
}
