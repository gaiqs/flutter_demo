import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/page/constants.dart';

class WigetsSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WigetsSampleState();
  }
}

class _WigetsSampleState extends State<WigetsSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetsSample'),
      ),
      body: Container(
        color: Color(AppColors.BackgroundColor),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                '这是一个文本Sample',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.save,
                          color: Colors.red[500],
                        ),
                        Container(
                          child: Text('save'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.save,
                          color: Colors.red[500],
                        ),
                        Container(
                          child: Text('save'),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
