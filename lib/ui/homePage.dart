import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_library_demo/model/model.dart';
import 'package:open_library_demo/ui/searching_screen.dart';
import 'package:open_library_demo/util/connectivitycontroller.dart';
import 'package:open_library_demo/viewModel/booksViewModel.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final BooksViewModel bookController = Get.put(BooksViewModel());
  final connectivityController = Get.put(ConnectivityController());

  @override
  void initState() {
    super.initState();
    //fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Books',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                splashColor: Colors.black54,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
        body: Obx(() {
          return Stack(children: [
            Column(
              children: [
                Expanded(
                    child: bookController.books.length > 0
                        ? ListView.builder(
                            itemCount: bookController.books.length,
                            itemBuilder: (context, index) {
                              return bookitem(index);
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          )),
              ],
            ),
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
          ]);
        }));
  }

  Widget bookitem(index) {
    Book work = bookController.books[index];
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
                    'https://covers.openlibrary.org/b/id/${work.cover_id.toString()}-M.jpg' ??
                        '',
                errorWidget: (context, url, error) {
                  final errorWidget = Image.asset('assets/paritycube_logo.jpeg',
                      fit: BoxFit.fill);
                  return Image.network(
                      'https://covers.openlibrary.org/b/id/${work.cover_id.toString()}-M.jpg',
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
                        work.author_names
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
                            onPressed: () {
                              bookController.toggleBookStatus(work);
                            },
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
