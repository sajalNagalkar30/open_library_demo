import 'package:get/get.dart';
import 'package:open_library_demo/apiService/bookService.dart';
import 'package:open_library_demo/model/model.dart';
import 'package:open_library_demo/util/connectivitycontroller.dart';

class SearchBookViewModel extends GetxController {
/*  final ConnectivityController _connectivityController = Get.find();*/
  final BookService _apiService = BookService();
  var books = <BookSearch>[].obs;
  var isSearchedItem = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> searchBooks(String search_title) async {
    try {
      isSearchedItem.value = true;
      final response = await _apiService.searchBooks(search_title);
      books.assignAll(response);
      isSearchedItem.value = false;
      /*  deals.value = response.deals;*/
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isSearchedItem.value = false;
    }
  }

  void toggleSearchBookStatus(BookSearch book) {
    final prodIndex = books.indexWhere((element) => element.key == book.key);
    final newWork = BookSearch(
        title: book.title,
        key: book.key,
        author_keys: book.author_keys,
        author_name: book.author_name,
        cover_edition_key: book.cover_edition_key,
        first_publish_year: book.first_publish_year,
        cover_i: book.cover_i,
        edition_key: book.edition_key,
        lending_edition_s: book.lending_edition_s,
        isRead: (book.isRead ?? false) ? false : true);
    books[prodIndex] = newWork;
  }
}
