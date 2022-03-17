import 'dart:convert';

import 'package:astro_gallery/data/rest/astronomy_api_client.dart';
import 'package:get_it/get_it.dart';

import '../models/apod_response.dart';
import '../models/mars_rover_photos_response.dart';
import 'iastronomy_repository.dart';

class AstronomyRepository implements IAstronomyRepository {

  late ApiClient mClient;

  AstronomyRepository() {
    mClient = GetIt.I<ApiClient>();
  }

  @override
  Future<ApodResponse?> getPictureOfTheDay() async {
    ApodResponse? res = await mClient.getPictureOfTheDay();

    if (res != null) {
      print('ApodResponse: ' + json.encode(res));
      print('title: $res.title');
      print('explanation: $res.explanation');
    } else {
      print('res is null');
    }

    return res;
  }

  @override
  Future<MarsRoverPhotosResponse?> getMarsRoverPhotos() async {
    MarsRoverPhotosResponse? res = await mClient.getMarsRoverPhotos();

    if (res != null) {
      print('MarsRoverPhotosResponse: ' + json.encode(res));
    } else {
      print('res is null');
    }

    return res;
  }
}
