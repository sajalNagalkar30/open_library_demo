import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Book {
  String? title;
  String? key;
   String? lending_edition_s;
  String? cover_edition_key;
   int? first_publish_year;
   int? cover_id;
   bool? isRead;
   List<String>? edition_key;
   List<String>? author_keys;
   List<String>? author_names;

  Book({
     this.title,
     this.key,
     this.lending_edition_s,
     this.cover_edition_key,
     this.first_publish_year,
     this.cover_id,
     this.edition_key,
     this.author_keys,
     this.author_names,
     this.isRead,
  });

  /*factory Work.fromMap(Map<String, dynamic> json) =>
      Work(
        title: json["title"] ?? '',
        key: json["key"] ?? '',
        lending_edition_s: json["lending_edition_s"].toString() ?? '',
        cover_edition_key: json["cover_edition_key"] ??'',
        first_publish_year: json[" first_publish_year"] ?? 0,
        cover_id: json["cover_id"].toString() ,
        edition_key: json["edition_key"] ,
        author_keys: json["author_keys"] ,
        author_names: json["author_names"] ,
      );

  Map<String, dynamic> toMap() => {
    "title": title,
    "key": key,
    "lending_edition_s": lending_edition_s,
    "cover_edition_key": cover_edition_key,
    "first_publish_year": first_publish_year,
    "cover_id": cover_id,
    "edition_key": edition_key,
    "author_keys": author_keys,
    "author_names": author_names,
  };*/

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class BookSearch {
  String? title;
  String? key;
  String? lending_edition_s;
  String? cover_edition_key;
  int? first_publish_year;
  int? cover_i;
  bool? isRead;
  List<String>? edition_key;
  List<String>? author_keys;
  List<String>? author_name;

  BookSearch({
    this.title,
    this.key,
    this.lending_edition_s,
    this.cover_edition_key,
    this.first_publish_year,
    this.cover_i,
    this.edition_key,
    this.author_keys,
    this.author_name,
    this.isRead,
  });

  /*factory Work.fromMap(Map<String, dynamic> json) =>
      Work(
        title: json["title"] ?? '',
        key: json["key"] ?? '',
        lending_edition_s: json["lending_edition_s"].toString() ?? '',
        cover_edition_key: json["cover_edition_key"] ??'',
        first_publish_year: json[" first_publish_year"] ?? 0,
        cover_id: json["cover_id"].toString() ,
        edition_key: json["edition_key"] ,
        author_keys: json["author_keys"] ,
        author_names: json["author_names"] ,
      );

  Map<String, dynamic> toMap() => {
    "title": title,
    "key": key,
    "lending_edition_s": lending_edition_s,
    "cover_edition_key": cover_edition_key,
    "first_publish_year": first_publish_year,
    "cover_id": cover_id,
    "edition_key": edition_key,
    "author_keys": author_keys,
    "author_names": author_names,
  };*/

  factory BookSearch.fromJson(Map<String, dynamic> json) => _$BookSearchFromJson(json);
  Map<String, dynamic> toJson() => _$BookSearchToJson(this);
}




