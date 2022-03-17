import 'package:rxdart/rxdart.dart';

import '../../data/models/apod_response.dart';
import '../../data/repositories/astronomy_repository.dart';
import '../common/base_bloc.dart';

class MainBloc extends BaseBloc {
  final AstronomyRepository astronomyRepository = AstronomyRepository();
  final _pictureFetcher = PublishSubject<ApodResponse>();

  Stream<ApodResponse> get pictureOfTheDay => _pictureFetcher.stream;

  fetchPictureOfTheDay() async {
    ApodResponse? picture = await astronomyRepository.getPictureOfTheDay();
    if (picture != null) {
      _pictureFetcher.sink.add(picture);
    }
  }

  @override
  void dispose() {
    _pictureFetcher.close();
  }
}

final mainBloc = MainBloc();
