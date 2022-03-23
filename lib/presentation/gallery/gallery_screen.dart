import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../core/constants.dart';
import '../common/app_bar.dart';
import '../common/bloc_provider.dart';
import 'gallery_bloc.dart';
import '../../data/models/mars_rover_photos_response.dart';
import '../common/base_stateful_widget.dart';
import '../details/mars_photo_detail_screen.dart';

class GalleryScreen extends BaseStatefulWidget {
  GalleryScreen({Key? key}) : super(key: key, title: Constants.galleryScreenTitle);

  @override
  State<GalleryScreen> createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen>
    with AutomaticKeepAliveClientMixin<GalleryScreen> {
  bool isListView = false;
  int itemsNumber = 24;

  late IGalleryBloc galleryBloc;

  @override
  void initState() {
    super.initState();
    galleryBloc = Injector().get<IGalleryBloc>();
    galleryBloc.fetchMarsRoverPictures();
  }

  List<Widget> createAppBarActions() {
    return [
      IconButton(
        icon: Icon((isListView) ? Icons.view_comfy : Icons.reorder),
        onPressed: onSwitchViewPressed,
      ),
    ];
  }

  void onSwitchViewPressed() {
    setState(() => isListView = !isListView);
  }

  @override
  Widget build(BuildContext context) {
    WillPopScope(
        onWillPop: () {
          return Future.value(Navigator.canPop(context));
        },
        child: Container());

    return BlocProvider(
      bloc: galleryBloc,
      key: const Key(""),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBarWidget(widget.title, createAppBarActions()),
          body: StreamBuilder(
            stream: galleryBloc.marsRoverPictures,
            builder:
                (context, AsyncSnapshot<MarsRoverPhotosResponse> response) {
              if (response.hasData) {
                return (isListView) ? listView(response) : gridView(response);
              } else if (response.hasError) {
                return Text(response.error.toString());
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget gridView(AsyncSnapshot<MarsRoverPhotosResponse> response) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent) {
          setState(() => itemsNumber += 12);
        }
        return true;
      },
      child: GridView.builder(
          itemCount: itemsNumber,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            MarsRoverPhotosResponse? marsRoverPhotosResponse = response.data;
            MarsRoverPhotoResponse? marsRoverPhotoResponse =
                marsRoverPhotosResponse?.photos[index];

            if (marsRoverPhotoResponse == null) {
              return ListView(
                  children: [Text(Constants.gettingMarsRoverFailed)]);
            }

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MarsPhotoDetailScreen(),
                    settings: RouteSettings(
                      arguments: DetailScreenArguments(
                          index, marsRoverPhotosResponse!),
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(Constants.commonPadding),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          marsRoverPhotoResponse.img_src)),
                ),
              ),
            );
          }),
    );
  }

  Widget listView(AsyncSnapshot<MarsRoverPhotosResponse> response) {
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.pixels ==
              scrollNotification.metrics.maxScrollExtent) {
            setState(() => itemsNumber += 12);
          }
          return true;
        },
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            MarsRoverPhotosResponse? marsRoverPhotosResponse = response.data;
            MarsRoverPhotoResponse? marsRoverPhotoResponse =
                marsRoverPhotosResponse?.photos[index];

            if (marsRoverPhotoResponse == null) {
              return ListView(
                  children: [Text(Constants.gettingMarsRoverFailed)]);
            }

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MarsPhotoDetailScreen(),
                      settings: RouteSettings(
                        arguments: DetailScreenArguments(
                            index, marsRoverPhotosResponse!),
                      )),
                );
              },
              child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: CachedNetworkImage(
                      imageUrl: marsRoverPhotoResponse.img_src)),
            );
          },
          itemCount: itemsNumber,
        ));
  }
}
