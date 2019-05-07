import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeChannel extends StatelessWidget{

  //Channel for Communication with Android View
  static const channel = const MethodChannel('foo');

  //Data to be passed to native module
  var _tempData;
  var _attractionType;
  NativeChannel(this._tempData, this._attractionType) {
    channel.setMethodCallHandler(_handleMethod);
    print("@nativeModule: Attraction type: " + _attractionType);
  }

  //Function to show location on Maps in Native android module
  Future<Null> showLocationOnMaps(String task) async {
    print('@_showLocationOnMaps: Called Successfully with data:  '+ _tempData.toString());
    await channel.invokeMethod(
        task , {"message": _tempData, "attractionType": _attractionType});
    print('@_showLocationOnMaps: Message sent to Native module');
  }
  //Function to handle the communication through method channel
  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "message":
        debugPrint(call.arguments);
        return new Future.value("");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
