import 'package:flutter/material.dart';

import 'localized/i18n.dart';
import 'manager/ShakeManager.dart';

class WhipStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WhipStatefulWidgetState();
}

class _WhipStatefulWidgetState extends State<WhipStatefulWidget> {
  Color _backgroundColor = Colors.red[300];
  String _textOnScreen;
  ShakeManager _shakeManager = ShakeManager();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _textOnScreen = I18n.of(context).whip_call;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _shakeManager.stopListening();
        updateColor(
            colorValue: Colors.red[300], textValue: I18n.of(context).whip_call);
      },
      onTapDown: (details) {
        _shakeManager.startListening();
        updateColor(
            colorValue: Colors.red, textValue: I18n.of(context).whipping_state);
      },
      onHorizontalDragEnd: (detail) {
        _shakeManager.stopListening();
        updateColor(
            colorValue: Colors.red[300], textValue: I18n.of(context).whip_call);
      },
      onVerticalDragEnd: (detail) {
        _shakeManager.stopListening();
        updateColor(
            colorValue: Colors.red[300], textValue: I18n.of(context).whip_call);
      },
      child: Container(
        color: _backgroundColor,
        child: Center(
          child: Text(
            _textOnScreen,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontFamily: 'BestInClass',
            ),
          ),
        ),
      ),
    );
  }

  void updateColor({Color colorValue, String textValue}) {
    setState(() {
      _backgroundColor = colorValue;
      _textOnScreen = textValue;
    });
  }
}
