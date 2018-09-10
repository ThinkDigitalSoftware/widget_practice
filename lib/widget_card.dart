import 'package:flutter/material.dart';

class WidgetCard extends StatelessWidget {
  final Widget child;

  final String title;

  const WidgetCard({Key key, @required this.child, @required this.title})
      : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).primaryTextTheme.subhead,
            ),
            child
          ],
        ),
      ),
    );
  }
}
