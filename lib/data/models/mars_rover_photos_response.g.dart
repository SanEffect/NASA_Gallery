// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mars_rover_photos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarsRoverPhotosResponse _$MarsRoverPhotosResponseFromJson(
        Map<String, dynamic> json) =>
    MarsRoverPhotosResponse(
      photos: (json['photos'] as List<dynamic>)
          .map(
              (e) => MarsRoverPhotoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarsRoverPhotosResponseToJson(
        MarsRoverPhotosResponse instance) =>
    <String, dynamic>{
      'photos': instance.photos,
    };

MarsRoverPhotoResponse _$MarsRoverPhotoResponseFromJson(
        Map<String, dynamic> json) =>
    MarsRoverPhotoResponse(
      id: json['id'] as int,
      sol: json['sol'] as int,
      img_src: json['img_src'] as String,
      earth_date: json['earth_date'] as String,
      rover: MarsRover.fromJson(json['rover'] as Map<String, dynamic>),
      camera: MarsRoverCamera.fromJson(json['camera'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarsRoverPhotoResponseToJson(
        MarsRoverPhotoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sol': instance.sol,
      'camera': instance.camera,
      'img_src': instance.img_src,
      'earth_date': instance.earth_date,
      'rover': instance.rover,
    };

MarsRover _$MarsRoverFromJson(Map<String, dynamic> json) => MarsRover(
      id: json['id'] as int,
      name: json['name'] as String,
      landing_date: json['landing_date'] as String,
      launch_date: json['launch_date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$MarsRoverToJson(MarsRover instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'landing_date': instance.landing_date,
      'launch_date': instance.launch_date,
      'status': instance.status,
    };

MarsRoverCamera _$MarsRoverCameraFromJson(Map<String, dynamic> json) =>
    MarsRoverCamera(
      id: json['id'] as int,
      rover_id: json['rover_id'] as int,
      name: json['name'] as String,
      full_name: json['full_name'] as String,
    );

Map<String, dynamic> _$MarsRoverCameraToJson(MarsRoverCamera instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rover_id': instance.rover_id,
      'full_name': instance.full_name,
    };
