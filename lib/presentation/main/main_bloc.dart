import 'package:rxdart/rxdart.dart';

import '../../data/models/apod_response.dart';
import '../../data/repositories/iastronomy_repository.dart';
import '../common/ibase_bloc.dart';

abstract class IMainBloc extends IBaseBloc {
  Stream<ApodResponse> get pictureOfTheDay;

  fetchPictureOfTheDay();
}

class MainBloc extends IMainBloc {
  IAstronomyRepository astronomyRepository;
  final _pictureFetcher = PublishSubject<ApodResponse>();

  MainBloc(this.astronomyRepository);

  @override
  Stream<ApodResponse> get pictureOfTheDay => _pictureFetcher.stream;

  @override
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
