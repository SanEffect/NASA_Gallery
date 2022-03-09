import 'package:flutter/material.dart';

import '../data/models/mars_rover_photos_response.dart';
import 'base_stateful_widget.dart';

class MarsPhotoDetailScreen extends BaseStatefulWidget {
  const MarsPhotoDetailScreen({Key? key}) : super(key: key, title: "Details");

  @override
  State<MarsPhotoDetailScreen> createState() => MarsPhotoDetailState();
}

class MarsPhotoDetailState extends State<MarsPhotoDetailScreen>
    with AutomaticKeepAliveClientMixin<MarsPhotoDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final marsRoverPhoto =
        ModalRoute.of(context)!.settings.arguments as MarsRoverPhotoResponse;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Container(
            color: Colors.white,
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder-image.png',
                image: marsRoverPhoto.img_src)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(marsRoverPhoto.earth_date),
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
