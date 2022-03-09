import '../models/apod_response.dart';
import '../models/mars_rover_photos_response.dart';

abstract class IAstronomyRepository {
  Future<ApodResponse?> getPictureOfTheDay();
  Future<MarsRoverPhotosResponse?> getMarsRoverPhotos();
}