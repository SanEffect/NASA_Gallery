import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/main_bloc.dart';
import '../data/models/apod_response.dart';
import 'base_stateful_widget.dart';

class MainScreen extends BaseStatefulWidget {
  const MainScreen({Key? key})
      : super(key: key, title: "Space Gallery Home Page");

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin<MainScreen> {
  @override
  void initState() {
    super.initState();
    mainBloc.fetchPictureOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: mainBloc,
      key: const Key(""),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.teal,
          ),
          body: StreamBuilder(
            stream: mainBloc.pictureOfTheDay,
            builder: (context, AsyncSnapshot<ApodResponse> response) {
              if (response.hasData) {
                return buildMainPage(response);
              } else if (response.hasError) {
                return Text(response.error.toString());
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }

  Widget buildMainPage(AsyncSnapshot<ApodResponse> response) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Astronomy Picture of the day",
                  style: Theme.of(context).textTheme.headline6,
                )),
            Container(
                color: Colors.white,
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder-image.png',
                    image: response.data!.url)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(response.data!.explanation),
            )
          ],
        ),
      ),
    ]);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    mainBloc.dispose();
    super.dispose();
  }
}
