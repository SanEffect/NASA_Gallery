import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../data/models/mars_rover_photos_response.dart';
import '../common/base_stateful_widget.dart';

class DetailScreenArguments {
  int currentIndex = 0;
  MarsRoverPhotosResponse marsRoverPhotosResponse;

  DetailScreenArguments(this.currentIndex, this.marsRoverPhotosResponse);
}

class MarsPhotoDetailScreen extends BaseStatefulWidget {
  const MarsPhotoDetailScreen({Key? key})
      : super(key: key, title: "Mars rover photo details");

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
        appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: const Color(0xffb121b22),
            actions: createAppBarActions()),
        body: PageView.builder(
            itemCount: args.marsRoverPhotosResponse.photos.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (pageIndex) {
              currentIndex = pageIndex;
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                  margin: const EdgeInsets.all(10),
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder-image.png',
                      image: photos[pagePosition].img_src));
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
