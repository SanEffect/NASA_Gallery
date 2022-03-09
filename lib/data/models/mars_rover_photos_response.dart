import 'package:json_annotation/json_annotation.dart';

part 'mars_rover_photos_response.g.dart';

@JsonSerializable()
class MarsRoverPhotosResponse {
  List<MarsRoverPhotoResponse> photos;

  MarsRoverPhotosResponse({
    required this.photos,
  });

  factory MarsRoverPhotosResponse.fromJson(Map<String, dynamic> json) =>
      _$MarsRoverPhotosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarsRoverPhotosResponseToJson(this);
}

@JsonSerializable()
class MarsRoverPhotoResponse {
  int id;
  int sol;

  MarsRoverCamera camera;
  String img_src;
  String earth_date;
  MarsRover rover;

  MarsRoverPhotoResponse({
    required this.id,
    required this.sol,
    required this.img_src,
    required this.earth_date,
    required this.rover,
    required this.camera,
  });

  factory MarsRoverPhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$MarsRoverPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarsRoverPhotoResponseToJson(this);
}

@JsonSerializable()
class MarsRover {
  int id;
  String name;
  String landing_date;
  String launch_date;
  String status;

  MarsRover({
    required this.id,
    required this.name,
    required this.landing_date,
    required this.launch_date,
    required this.status,
  });

  factory MarsRover.fromJson(Map<String, dynamic> json) =>
      _$MarsRoverFromJson(json);

  Map<String, dynamic> toJson() => _$MarsRoverToJson(this);
}

@JsonSerializable()
class MarsRoverCamera {
  int id;
  String name;
  int rover_id;
  String full_name;

  MarsRoverCamera({
    required this.id,
    required this.rover_id,
    required this.name,
    required this.full_name,
  });

  factory MarsRoverCamera.fromJson(Map<String, dynamic> json) =>
      _$MarsRoverCameraFromJson(json);

  Map<String, dynamic> toJson() => _$MarsRoverCameraToJson(this);
}
