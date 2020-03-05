import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/page/constants.dart';

class FullWidthButton extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  const FullWidthButton({
    this.title,
    this.iconPath,
    this.onPressed,
    this.showDivider: false,
  })  : assert(iconPath != null),
        assert(title != null),
        assert(onPressed != null);

  final String title;
  final String iconPath;
  final bool showDivider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final pureButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        SizedBox(width: HORIZONTAL_PADDING),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Icon(
          IconData(
            0xe664,
            fontFamily: Constants.IconFontFamily,
          ),
          size: 22.0,
          color: Color(AppColors.TabIconNormal),
        ),
      ],
    );

    final borderButton = Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color(AppColors.DividerColor),
                width: Constants.DividerWidth)),
      ),
      padding: EdgeInsets.only(bottom: VERTICAL_PADDING),
      child: pureButton,
    );

    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(
          left: HORIZONTAL_PADDING,
          right: HORIZONTAL_PADDING,
          top: VERTICAL_PADDING,
          bottom: showDivider ? 0.0 : VERTICAL_PADDING),
      color: Colors.white,
      child: showDivider ? borderButton : pureButton,
    );
  }
}
