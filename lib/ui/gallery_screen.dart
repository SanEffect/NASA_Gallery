import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/gallery_bloc.dart';
import '../data/models/mars_rover_photos_response.dart';
import 'base_stateful_widget.dart';
import 'mars_photo_detail_screen.dart';

class GalleryScreen extends BaseStatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key, title: "Gallery Screen");

  @override
  State<GalleryScreen> createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen>
    with AutomaticKeepAliveClientMixin<GalleryScreen> {
  bool isListView = false;

  @override
  void initState() {
    super.initState();
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
          appBar: AppBar(
              title: Text(widget.title),
              backgroundColor: Colors.teal,
              actions: createAppBarActions()),
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

    // return Scaffold(
    //     appBar: AppBar(
    //         title: Text(widget.title),
    //         backgroundColor: Colors.teal,
    //         actions: createAppBarActions()),
    //     body: ListView(children: <Widget>[
    //       if (photosIsLoaded) ...[
    //         (isListView) ? listView() : gridView()
    //       ]
    //     ]));
  }

  @override
  bool get wantKeepAlive => true;

  Widget gridView(AsyncSnapshot<MarsRoverPhotosResponse> response) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 3,
          ),
          // itemCount: _items.length,
          itemCount: 27,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('Go to detail page. Index: $index');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MarsPhotoDetailScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        response.data?.photos[index]['img_src']),
                    // marsRoverPhotosResponse.photos[index]['img_src']),
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget listView(AsyncSnapshot<MarsRoverPhotosResponse> response) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                print('Go to detail page. Index: $index');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MarsPhotoDetailScreen()),
                );
              },
              child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: CachedNetworkImage(
                      imageUrl: response.data?.photos[index]['img_src'])),
            );
          },
          itemCount: 27,
        ));
  }
}
