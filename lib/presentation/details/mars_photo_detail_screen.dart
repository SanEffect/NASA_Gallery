import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/constants.dart';
import '../../data/models/mars_rover_photos_response.dart';
import '../common/app_bar.dart';
import '../common/base_stateful_widget.dart';

class DetailScreenArguments {
  int currentIndex = 0;
  MarsRoverPhotosResponse marsRoverPhotosResponse;

  DetailScreenArguments(this.currentIndex, this.marsRoverPhotosResponse);
}

class MarsPhotoDetailScreen extends BaseStatefulWidget {
  MarsPhotoDetailScreen({Key? key})
      : super(key: key, title: Constants.detailScreenTitle);

  @override
  State<MarsPhotoDetailScreen> createState() => MarsPhotoDetailState();
}

class MarsPhotoDetailState extends State<MarsPhotoDetailScreen>
    with AutomaticKeepAliveClientMixin<MarsPhotoDetailScreen> {
  late DetailScreenArguments args;
  late PageController _pageController;
  late MarsRoverPhotoResponse marsRoverPhoto;

  int currentIndex = 0;
  List<MarsRoverPhotoResponse> photos = [];

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as DetailScreenArguments;

    currentIndex = args.currentIndex;
    _pageController = PageController(initialPage: args.currentIndex);
    photos = args.marsRoverPhotosResponse.photos;

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: appBarWidget(widget.title, createAppBarActions()),
        body: PageView.builder(
            itemCount: args.marsRoverPhotosResponse.photos.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (pageIndex) {
              currentIndex = pageIndex;
            },
            itemBuilder: (context, pagePosition) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      imageUrl: photos[pagePosition].img_src,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                ],
              ));
            }));
  }

  @override
  bool get wantKeepAlive => true;

  List<Widget> createAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.share),
        onPressed: onSharePressed,
      ),
    ];
  }

  void onSharePressed() {
    Share.share(photos[currentIndex].img_src);
  }
}
