import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../core/constants.dart';
import '../common/app_bar.dart';
import '../common/bloc_provider.dart';
import 'main_bloc.dart';
import '../../data/models/apod_response.dart';
import '../common/base_stateful_widget.dart';

class MainScreen extends BaseStatefulWidget {
  MainScreen({Key? key}) : super(key: key, title: Constants.mainScreenTitle);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin<MainScreen> {
  late IMainBloc mainBloc;

  @override
  void initState() {
    super.initState();
    mainBloc = Injector().get<IMainBloc>();
    mainBloc.fetchPictureOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: mainBloc,
      key: const Key(""),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBarWidget(widget.title, null),
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
                  Constants.astroPictureOfTheDay,
                  style: Theme.of(context).textTheme.headline6,
                )),
            Container(
                color: Colors.white,
                child: FadeInImage.assetNetwork(
                    placeholder: Constants.placeholderImagePath,
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
    Injector().dispose();
    super.dispose();
  }
}
