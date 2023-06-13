import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

Future<void> atualizarEmprestimoLivroFirebase(livroId, operacao) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final QuerySnapshot querySnapshot = await db
      .collection('livros')
      .where('isbn', isEqualTo: livroId)
      .get();
  final DocumentSnapshot livroSnapshot = querySnapshot.docs.first;
  final DocumentReference livroRef = livroSnapshot.reference;

  livroRef.update({'emprestimo': '${operacao}'});
  Get.snackbar('Operação realizada com sucesso',
      '');
}
