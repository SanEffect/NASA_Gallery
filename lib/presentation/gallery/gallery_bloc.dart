import 'package:rxdart/rxdart.dart';

import '../../data/models/mars_rover_photos_response.dart';
import '../../data/repositories/iastronomy_repository.dart';
import '../common/ibase_bloc.dart';

abstract class IGalleryBloc extends IBaseBloc {
  Stream<MarsRoverPhotosResponse> get marsRoverPictures;

  fetchMarsRoverPictures();
}

class GalleryBloc extends IGalleryBloc {
  IAstronomyRepository astronomyRepository;
  final _picturesFetcher = PublishSubject<MarsRoverPhotosResponse>();

  GalleryBloc(this.astronomyRepository);

  @override
  Stream<MarsRoverPhotosResponse> get marsRoverPictures =>
      _picturesFetcher.stream;

  @override
  fetchMarsRoverPictures() async {
    MarsRoverPhotosResponse? pictures =
        await astronomyRepository.getMarsRoverPhotos();
    if (pictures != null) {
      _picturesFetcher.sink.add(pictures);
    }
  }

  @override
  void dispose() {
    _picturesFetcher.close();
  }
}
