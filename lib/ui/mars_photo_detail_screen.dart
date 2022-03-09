import 'package:flutter/material.dart';
import 'base_stateful_widget.dart';

class MarsPhotoDetailScreen extends BaseStatefulWidget {
  const MarsPhotoDetailScreen({Key? key})
      : super(key: key, title: "Space Gallery Home Page");

  @override
  State<MarsPhotoDetailScreen> createState() => MarsPhotoDetailState();
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class MarsPhotoDetailState extends State<MarsPhotoDetailScreen>
    with AutomaticKeepAliveClientMixin<MarsPhotoDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("Photo Detail"),
              // Container(
              //     color: Colors.white,
              //     child: FadeInImage.assetNetwork(
              //         placeholder: '../assets/placeholder.png',
              //         image: astroInfo.url)
              // ),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
