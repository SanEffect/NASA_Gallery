// InheritedWidget objects have the ability to be
// searched for anywhere 'below' them in the widget tree.

import 'package:flutter/cupertino.dart';

import 'ibase_bloc.dart';

class BlocProvider<T extends IBaseBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({required Key key, required this.bloc, required this.child})
      : super(key: key);

  static T of<T extends IBaseBloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    // final BlocProvider<T> provider = context.findAncestorWidgetOfExactType(type);
    final BlocProvider<T> provider = context.getElementForInheritedWidgetOfExactType() as BlocProvider<T>;
    return provider.bloc;
  }

  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
