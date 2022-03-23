import 'package:astro_gallery/presentation/main/main_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../data/repositories/astronomy_repository.dart';
import '../../data/repositories/iastronomy_repository.dart';
import '../../data/rest/astronomy_api_client.dart';
import '../../presentation/gallery/gallery_bloc.dart';
import '../constants.dart';

class MainContainer {
  Injector injector = Injector();

  void initialize() {
    _registerRest();
    _registerRepositories();
    _registerBlocs();
  }

  void _registerRest() {
    injector.map<Dio>((i) => Dio());
    injector.map<ApiClient>(
        (i) => ApiClient(injector.get<Dio>(), baseUrl: Constants.nasaBaseUrl));
  }

  void _registerRepositories() {
    injector.map<IAstronomyRepository>(
        (i) => AstronomyRepository(injector.get<ApiClient>()));
  }

  void _registerBlocs() {
    injector.map<IMainBloc>((i) => MainBloc(injector.get<IAstronomyRepository>()));
    injector.map<IGalleryBloc>((i) => GalleryBloc(injector.get<IAstronomyRepository>()));
  }
}