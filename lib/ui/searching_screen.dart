import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_library_demo/model/model.dart';
import 'package:open_library_demo/util/connectivitycontroller.dart';
import 'package:open_library_demo/viewModel/searchBookViewModel.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final focus = FocusNode();
  final SearchBookViewModel bookController = Get.put(SearchBookViewModel());
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  String nobook = 'Enter the title of book which you want to search';
  TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    bookController.books.clear();
    //fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: Colors.blue,
            title: TextField(
              controller: searchcontroller,
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Search for books',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
            actions: <Widget>[
              IgnorePointer(
                ignoring: !connectivityController.isConnected.value ||
                    bookController.isSearchedItem.value,
                child: IconButton(
                  splashColor: Colors.black54,
                  onPressed: () {
                    bookController.searchBooks(searchcontroller.text);
                    bookController.books.clear();
                    FocusScope.of(context).requestFocus(focus);
                  },
                  icon: Icon(
                    Icons.search,
                    color: !connectivityController.isConnected.value ||
                            bookController.isSearchedItem.value
                        ? Colors.white30
                        : Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          body: Stack(
            children: [
              Column(children: [
                Expanded(
                    child: bookController.books.length > 0
                        ? ListView.builder(
                            itemCount: bookController.books.length,
                            itemBuilder: (context, index) {
                              return Searchedbookitem(index);
                            })
                        : Center(
                            child: bookController.isSearchedItem.value
                                ? CircularProgressIndicator()
                                : Text(
                                    nobook,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ))),
              ]),
              if (!connectivityController.isConnected.value)
                Container(
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      'No Internet Please Connect Your device to WIFI or On your Mobile data',
                      style: TextStyle(color: Colors.redAccent, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ));
    });
  }

  Widget Searchedbookitem(index) {
    //  String author=bookSearchResult[index].author_name.toString().replaceAll(RegExp(r"[\[\]]"), "");
    BookSearch work = bookController.books[index];
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                fit: BoxFit.fitWidth,
                height: 120,
                width: 90,
                imageUrl:
                    'https://covers.openlibrary.org/b/id/${work.cover_i.toString()}-M.jpg' ??
                        '',
                errorWidget: (context, url, error) {
                  final errorWidget = Image.asset('assets/paritycube_logo.jpeg',
                      fit: BoxFit.fill);
                  return Image.network(
                      'https://covers.openlibrary.org/b/id/${work.cover_i.toString()}-M.jpg',
                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) => errorWidget);
                },
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  width: 215,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        work.title.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        work.author_name
                            .toString()
                            .replaceAll(RegExp(r"[\[\]]"), ""),
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w800,
                            fontSize: 12),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        work.first_publish_year.toString(),
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w800,
                            fontSize: 12),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                bookController.toggleSearchBookStatus(work),
                            child: Text(
                              work.isRead ?? false ? 'Read' : 'Unread',
                              style: TextStyle(
                                  color: work.isRead ?? false
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  work.isRead ?? false ? Colors.green : null,
                              shape: work.isRead ?? false
                                  ? RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))
                                  : RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.grey)),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
