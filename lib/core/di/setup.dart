import 'package:astro_gallery/data/repositories/iastronomy_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../data/repositories/astronomy_repository.dart';
import '../../data/rest/astronomy_api_client.dart';
import '../constants.dart';

setupLocator() {
  GetIt locator = GetIt.instance;

  locator.registerFactory<Dio>(() => Dio());
  locator.registerFactory<ApiClient>(() => ApiClient(locator<Dio>(), baseUrl: Constants.nasaBaseUrl));
  // locator.registerFactory<IAstronomyRepository>(() => AstronomyRepository(locator<ApiClient>()));
}