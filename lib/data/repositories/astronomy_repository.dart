import 'package:astro_gallery/data/rest/astronomy_api_client.dart';

import '../models/apod_response.dart';
import '../models/mars_rover_photos_response.dart';
import 'iastronomy_repository.dart';

class AstronomyRepository implements IAstronomyRepository {
  ApiClient mClient;

  AstronomyRepository(this.mClient);

  @override
  Future<ApodResponse?> getPictureOfTheDay() async {
    return await mClient.getPictureOfTheDay();
  }

  @override
  Future<MarsRoverPhotosResponse?> getMarsRoverPhotos() async {
    return await mClient.getMarsRoverPhotos();
  }
}
