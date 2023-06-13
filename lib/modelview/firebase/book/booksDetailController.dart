
import 'package:get/get.dart';

import '../../../model/Book.dart';

class BookDetailsController extends GetxController {
  final Book book;

  BookDetailsController(this.book);

  void cleanController(){
    Get.delete<BookDetailsController>();
  }



}
