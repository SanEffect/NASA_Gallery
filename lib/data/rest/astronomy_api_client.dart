import 'package:astro_gallery/data/models/mars_rover_photos_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/apod_response.dart';

part 'astronomy_api_client.g.dart';

class ApiCalls {
  static const String key = "QCWnMqRWFjbKAYQ7HfRYTN2jEdis2jYf65V2vkf8";

  static const String planetary = '/planetary/apod?api_key=$key';
  static const String marsRoverPhotos = '/mars-photos/api/v1/rovers/curiosity/photos?sol=100&api_key=$key';
}

@RestApi(baseUrl: "https://api.nasa.gov")
abstract class ApiClient {
  factory ApiClient(Dio dio, {required String baseUrl}) = _ApiClient;

  @GET(ApiCalls.planetary)
  Future<ApodResponse> getPictureOfTheDay();

  @GET(ApiCalls.marsRoverPhotos)
  Future<MarsRoverPhotosResponse> getMarsRoverPhotos();
}
