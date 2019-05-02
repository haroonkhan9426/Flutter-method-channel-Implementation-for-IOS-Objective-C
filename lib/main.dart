import 'package:flutter/material.dart';
import 'nativ_channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  NativeChannel nativeChannel;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ios mapbox integration"),
        ),
        body: Container(

        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              nativeChannel = NativeChannel("Test Data list",
              "Test Attraction point");
              nativeChannel.showLocationOnMaps("Test Data");
              print("Button Pressed");
            }
        ),
      )
    );
  }
}
