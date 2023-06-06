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
