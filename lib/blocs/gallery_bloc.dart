import 'package:rxdart/rxdart.dart';
import '../data/models/mars_rover_photos_response.dart';
import '../data/repositories/astronomy_repository.dart';
import 'base_bloc.dart';

class GalleryBloc extends BaseBloc {

  final AstronomyRepository astronomyRepository = AstronomyRepository();
  final _picturesFetcher = PublishSubject<MarsRoverPhotosResponse>();

  Stream<MarsRoverPhotosResponse> get marsRoverPictures => _picturesFetcher.stream;

  fetchMarsRoverPictures() async {
    MarsRoverPhotosResponse? pictures = await astronomyRepository.getMarsRoverPhotos();
    if(pictures != null) {
      _picturesFetcher.sink.add(pictures);
    }
  }

  @override
  void dispose() {
    _picturesFetcher.close();
  }

}

final galleryBloc = GalleryBloc();