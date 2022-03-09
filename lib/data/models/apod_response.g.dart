// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApodResponse _$ApodResponseFromJson(Map<String, dynamic> json) => ApodResponse(
      title: json['title'] as String?,
      date: json['date'] as String,
      explanation: json['explanation'] as String,
      url: json['url'] as String,
      media_type: json['media_type'] as String,
      service_version: json['service_version'] as String,
    )..hdurl = json['hdurl'] as String;

Map<String, dynamic> _$ApodResponseToJson(ApodResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': instance.date,
      'explanation': instance.explanation,
      'url': instance.url,
      'hdurl': instance.hdurl,
      'media_type': instance.media_type,
      'service_version': instance.service_version,
    };
