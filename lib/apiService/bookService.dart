import 'package:dio/dio.dart';
import 'package:open_library_demo/model/model.dart';
import 'dart:convert';

class BookService {
  Future<List<Book>> fetchBooks() async {
    List<Book> books = [];
    try {
      final response = await Dio()
          .get('https://openlibrary.org/people/mekBot/books/already-read.json');
      if (response.data != null) {
        var jsonData = await json
            .decode(json.encode(response.data['reading_log_entries']));
        print('----------------------------------${jsonData[0]}');
        for (int i = 0; i < jsonData.length; i++) {
          books.add(Book.fromJson(jsonData[i]['work']));
        }

        return books;
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Exception caught ---------${e}');
    } finally {
      return books;
    }
  }

  Future<List<BookSearch>> searchBooks(String seacrh_title) async {
    List<BookSearch> searchbooks = [];
    try {
      final response = await Dio().get('https://openlibrary.org/search.json',
          queryParameters: {'title': seacrh_title.replaceAll(' ', '+')});
      if (response.data != null) {
        print('----------------------------------${response.data['docs'][1]}');
        var jsonData = await json.decode(json.encode(response.data['docs']));

        for (int i = 0; i < jsonData.length; i++) {
          searchbooks.add(BookSearch.fromJson(jsonData[i]));
        }

        return searchbooks;
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Exception caught ---------${e}');
    } finally {
      return searchbooks;
    }
  }
}
