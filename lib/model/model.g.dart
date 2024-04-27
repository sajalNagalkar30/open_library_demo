// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      title: json['title'] as String?,
      key: json['key'] as String?,
      lending_edition_s: json['lending_edition_s'] as String?,
      cover_edition_key: json['cover_edition_key'] as String?,
      first_publish_year: (json['first_publish_year'] as num?)?.toInt(),
      cover_id: (json['cover_id'] as num?)?.toInt(),
      edition_key: (json['edition_key'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      author_keys: (json['author_keys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      author_names: (json['author_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'key': instance.key,
      'lending_edition_s': instance.lending_edition_s,
      'cover_edition_key': instance.cover_edition_key,
      'first_publish_year': instance.first_publish_year,
      'cover_id': instance.cover_id,
      'isRead': instance.isRead,
      'edition_key': instance.edition_key,
      'author_keys': instance.author_keys,
      'author_names': instance.author_names,
    };

BookSearch _$BookSearchFromJson(Map<String, dynamic> json) => BookSearch(
      title: json['title'] as String?,
      key: json['key'] as String?,
      lending_edition_s: json['lending_edition_s'] as String?,
      cover_edition_key: json['cover_edition_key'] as String?,
      first_publish_year: (json['first_publish_year'] as num?)?.toInt(),
      cover_i: (json['cover_i'] as num?)?.toInt(),
      edition_key: (json['edition_key'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      author_keys: (json['author_keys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      author_name: (json['author_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$BookSearchToJson(BookSearch instance) =>
    <String, dynamic>{
      'title': instance.title,
      'key': instance.key,
      'lending_edition_s': instance.lending_edition_s,
      'cover_edition_key': instance.cover_edition_key,
      'first_publish_year': instance.first_publish_year,
      'cover_i': instance.cover_i,
      'isRead': instance.isRead,
      'edition_key': instance.edition_key,
      'author_keys': instance.author_keys,
      'author_name': instance.author_name,
    };
