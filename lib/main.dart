import 'package:flutter/material.dart';
import './UI/Home/home.dart';
import './UI/Timeline/timeline.dart';
import './UI/EventPage/eventPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pages'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 30),
              // Links to pages
              RaisedButton(
                  child: Text('Home Page'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }),
              RaisedButton(
                  child: Text('Timeline'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Timeline()));
                  
                  }),
              RaisedButton(
                  child: Text('Event Page'),
                  onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventPage()));
                  }),
            ],
          ),
        ));
  }
}
