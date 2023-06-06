class Book {
  String nome;
  String emailDono;
  String sinopse;
  String isbn;
  String capa;

  Book({
    required this.nome,
    required this.emailDono,
    required this.sinopse,
    required this.isbn,
    required this.capa,
  });

  // Método para transformar um mapa em um objeto Livro
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      nome: map['nome'],
      emailDono: map['emailDono'],
      sinopse: map['sinopse'],
      isbn: map['isbn'],
      capa: map['capa'],
    );
  }

  // Método para transformar um objeto Livro em um mapa
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'emailDono': emailDono,
      'sinopse': sinopse,
      'isbn': isbn,
      'capa': capa,
    };
  }
}
