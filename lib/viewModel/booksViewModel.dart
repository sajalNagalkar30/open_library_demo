import 'package:get/get.dart';
import 'package:open_library_demo/apiService/bookService.dart';
import 'package:open_library_demo/model/model.dart';
import 'package:open_library_demo/util/connectivitycontroller.dart';

class BooksViewModel extends GetxController {
  final ConnectivityController _connectivityController =
      Get.put(ConnectivityController());
  final BookService _apiService = BookService();
  var books = <Book>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchData();
    if (_connectivityController.isConnected.value) {
      fetchData();
    }
    _connectivityController.isConnected.listen((isConnected) {
      if (isConnected) {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    books.clear();
    try {
      final response = await _apiService.fetchBooks();
      books.assignAll(response);
      /*  deals.value = response.deals;*/
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleBookStatus(Book book) {
    final prodIndex = books.indexWhere((element) => element.key == book.key);
    final newWork = Book(
        title: book.title,
        key: book.key,
        author_keys: book.author_keys,
        author_names: book.author_names,
        cover_edition_key: book.cover_edition_key,
        first_publish_year: book.first_publish_year,
        cover_id: book.cover_id,
        edition_key: book.edition_key,
        lending_edition_s: book.lending_edition_s,
        isRead: (book.isRead ?? false) ? false : true);
    books[prodIndex] = newWork;
  }
}
