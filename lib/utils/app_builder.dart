import 'package:flutter/material.dart';

class AppBuilder extends StatefulWidget {
  final Function(BuildContext) builder;

  const AppBuilder({Key key, this.builder}) : super(key: key);

  @override
  _AppBuilderState createState() => _AppBuilderState();
  static _AppBuilderState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppBuilderState>();
}

class _AppBuilderState extends State<AppBuilder> {
  Key key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.builder(context));
  }

  void rebuild() {
    setState(() {
      key = UniqueKey();
    });
  }
}
