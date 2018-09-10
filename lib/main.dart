import 'package:flutter/material.dart';

import 'package:widget_practice/pages/example1.dart';
import 'widget_card.dart';

main(List<String> arguments) {
  runApp(new MaterialApp(
    title: "Widget Practice",
    home: MainPage(),
    theme: ThemeData(
        primaryTextTheme: TextTheme(
            subhead: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold))),
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

Map<String, Widget> pages = {"example1": Example1(), "example2": Text("")};
String dropDownValue = pages.keys.first;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    //alphabetize automatically
    Map<String, Widget> widgetMap = {};

    widgetMap['Wrap'] = Wrap(
      children: List<Icon>.generate(
        10,
        (int index) => Icon(
              Icons.add_circle_outline,
              size: 50.0,
            ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: widgetMap
                    .map((title, widget) {
                      return MapEntry(
                          title, WidgetCard(title: title, child: widget));
                    })
                    .values
                    .toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                DropdownButton<String>(
                  value: dropDownValue,
                  items: pages.keys.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(growable: false),
                  onChanged: (String value) {
                    setState(() {
                      dropDownValue = value;
                      debugPrint(dropDownValue);
                    });
                  },
                ),
                FlatButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.navigate_next),
                    label: Text("Go"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
