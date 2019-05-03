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

            child: Center(
              child: RaisedButton(
                  child: Text("ShowLocationAndNavigate"),
                  onPressed: () {
                print("Raised Button Pressed");
                nativeChannel =
                    NativeChannel("Test Data list", "Test Attraction point");
                nativeChannel.showLocationOnMaps("ShowLocationAndNavigate");
              }),
            )
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            print("Button Pressed");
            nativeChannel = NativeChannel("Test Data list", "Test Attraction point");
            nativeChannel.showLocationOnMaps("ShowMultipleLocations");

          }),
        ));
  }
}
