import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/page/constants.dart';
import 'package:flutter_demo/ui/page/full_width_button.dart';

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoState();
  }
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: Constants.Height),
          FullWidthButton(
            iconPath: "assets/images/ic_wallet.png",
            title: "Flutter交互",
            onPressed: () {
              _open();
            },
            showDivider: true,
          ),
          FullWidthButton(
            iconPath: "assets/images/ic_wallet.png",
            onPressed: () {},
            title: "UI控件测试",
            showDivider: true,
          ),
        ],
      ),
    );
    return ListView(
      children: <Widget>[
        GestureDetector(
          onTap: _open,
          child: Container(
            height: 50,
            color: Colors.amber[900],
            child: Center(child: Text("原生交互")),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[800],
          child: const Center(child: Text('测试数据')),
        ),
        Container(
          constraints: new BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          ),
          decoration: new BoxDecoration(
            border: new Border.all(width: 2.0, color: Colors.red),
            color: Colors.grey,
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
            image: new DecorationImage(
              image: new NetworkImage(
                  'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
        )
      ],
    );
  }

  void _open() {
    Navigator.of(context).pushNamed('channel');
  }
}
