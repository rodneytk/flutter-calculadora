import 'package:flutter/material.dart';
import 'button_row.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) callbackButton;
  Keyboard(this.callbackButton);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button(text: 'AC', theme: Button.DARK, callbackButton: callbackButton),
            Button(text: '%', theme: Button.DARK, callbackButton: callbackButton),
            Button(text: '<', theme: Button.DARK, callbackButton: callbackButton),
            Button(text: '/', theme: Button.ORANGE, callbackButton: callbackButton),
          ]),
          SizedBox(height: 3),
          ButtonRow([
            Button(text: '7', callbackButton: callbackButton),
            Button(text: '8', callbackButton: callbackButton),
            Button(text: '9', callbackButton: callbackButton),
            Button(text: '*', theme: Button.ORANGE, callbackButton: callbackButton),
          ]),
          SizedBox(height: 3),
          ButtonRow([
            Button(text: '4', callbackButton: callbackButton),
            Button(text: '5', callbackButton: callbackButton),
            Button(text: '6', callbackButton: callbackButton),
            Button(text: '-', theme: Button.ORANGE, callbackButton: callbackButton),
          ]),
          SizedBox(height: 3),
          ButtonRow([
            Button(text: '1', callbackButton: callbackButton),
            Button(text: '2', callbackButton: callbackButton),
            Button(text: '3', callbackButton: callbackButton),
            Button(text: '+', theme: Button.ORANGE, callbackButton: callbackButton),
          ]),
          SizedBox(height: 3),
          ButtonRow([
            Button(text: '0', colSpan: 2, callbackButton: callbackButton),
            Button(text: '.', callbackButton: callbackButton),
            Button(text: '=', theme: Button.ORANGE, callbackButton: callbackButton),
          ]),
        ],
      ),
    );
  }
}