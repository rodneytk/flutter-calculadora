import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const ORANGE = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final int colSpan;
  final Color theme;
  final void Function(String) callbackButton;

  Button({
    @required this.text,
    this.colSpan = 1,
    this.theme = DEFAULT,
    @required this.callbackButton,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: colSpan,
      child: RaisedButton(
        color: theme,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200
          ),
        ),
        onPressed: () => callbackButton(text),
      )
    );
  }
}