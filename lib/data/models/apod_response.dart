import 'package:json_annotation/json_annotation.dart';
part 'apod_response.g.dart';

// @JsonSerializable()
// class ResponseData{
//   int code;
//   dynamic meta;
//   List<dynamic>data;
//   ResponseData({required this.code, this.meta,required  this.data});
//   factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);
//   Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
// }

@JsonSerializable()
class ApodResponse {
  String? title;
  String date;
  String explanation;
  String url;
  String hdurl = "";
  String media_type = "";
  String service_version = "";
  ApodResponse({
    required this.title,
    required this.date,
    required this.explanation,
    required this.url,
    required this.media_type,
    required this.service_version,
  });
  factory ApodResponse.fromJson(Map<String, dynamic> json) => _$ApodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApodResponseToJson(this);
}


