import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/ui/channel/channel_config.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ChannelPageState();
  }
}

class _ChannelPageState extends State<ChannelPage> {
  static const open = const MethodChannel(ChannelConfig.CHANNEL_OPEN);

  static const time = const EventChannel(ChannelConfig.CHANNEL_TIME);

  static const location = const EventChannel(ChannelConfig.CHANNEL_LOCATION);

  static const perimissionsPlugin =
      const MethodChannel(ChannelConfig.CHANNEL_PMSS);

  StreamSubscription _counterSub;

  StreamSubscription _amapSub;

  var _count;

  var _city;

  @override
  void initState() {
    super.initState();
    _startCounterPlugin();
  }

  @override
  void dispose() {
    super.dispose();
    _endCounterPlugin();
    _endAMapPlugin();
  }

  _showDialog() {
    showDialog<Null>(
      context: context,
      child:
          new AlertDialog(content: new Text('是否前去设置未开通权限'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              _goSetting();
            },
            child: new Text('确定'))
      ]),
    );
  }

  Future<bool> _askPermission(List perimissions) async {
    bool result =
        await perimissionsPlugin.invokeMethod('askPermissions', perimissions);

    return result;
  }

  Future<Null> _goSetting() async {
    await perimissionsPlugin.invokeMethod('openSetting');

    return null;
  }

  void _startAMapPlugin() {
    List perimissions = new List();

    perimissions.add("ACCESS_COARSE_LOCATION");
    perimissions.add("ACCESS_FINE_LOCATION");
    perimissions.add("READ_PHONE_STATE");
    perimissions.add("WRITE_EXTERNAL_STORAGE");

    _askPermission(perimissions).then((granted) {
      if (granted) {
        if (_amapSub == null) {
          _amapSub = location
              .receiveBroadcastStream()
              .listen(_onAMapEvent, onError: _onAMapError);
        }
      } else {
        _showDialog();
      }
    });
  }

  void _endAMapPlugin() {
    if (_amapSub != null) {
      _amapSub.cancel();
    }
  }

  void _onAMapEvent(Object event) {
    Map<String, Object> loc = Map.castFrom(event);

    setState(() {
      _city = loc['city'];
      print(event);
    });
  }

  void _onAMapError(Object error) {
    setState(() {
      _city = "定位异常";
      print(error);
    });
  }

  void _startCounterPlugin() {
    if (_counterSub == null) {
      _counterSub = time
          .receiveBroadcastStream()
          .listen(_onCounterEvent, onError: _onCounterError);
    }
  }

  void _endCounterPlugin() {
    if (_counterSub != null) {
      _counterSub.cancel();
    }
  }

  void _onCounterEvent(Object event) {
    setState(() {
      _count = event;
    });
  }

  void _onCounterError(Object error) {
    setState(() {
      _count = "计时器异常";
      print(error);
    });
  }

  Future<Null> _openNative() async {
    String result = await open.invokeMethod(ChannelConfig.OPEN_HTTPS);
    print(result);
  }

  Future<Null> _openNativeWithValue() async {
    Map<String, String> map = {"vin": "https"};
    String result =
        await open.invokeMethod(ChannelConfig.OPEN_HTTPS_PARAMS, map);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Channel"),
        centerTitle: true,
      ),
      body: new Center(
          child: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('跳转到原生界面'),
                onPressed: () {
                  _openNative();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('跳转到原生界面(带参数)'),
                onPressed: () {
                  _openNativeWithValue();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('点击获取当前定位'),
                onPressed: () {
                  _startAMapPlugin();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('停止接收获取当前定位'),
                onPressed: () {
                  _endAMapPlugin();
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('这是一个从原生发射过来的计时器：$_count'),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text('当前定位：$_city'),
          ),
        ],
      )),
    );
  }
}
