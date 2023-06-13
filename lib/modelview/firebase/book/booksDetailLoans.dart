import 'package:book_swapping/modelview/firebase/book/atualizarEmprestimoLIvroFirebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'booksDetailController.dart';


class BookDetailsLoans extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final BookDetailsController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Livro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(controller.book.capa),
            ),
            SizedBox(height: 16),

            SizedBox(height: 8),
            Text(
              'ISBN:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              controller.book.isbn,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Sinopse:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              controller.book.sinopse,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  

                }, child: Text('Solicitar Empréstimo')),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
