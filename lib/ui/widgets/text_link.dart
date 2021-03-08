import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final Text text;
  final Color? color;

  const TextLink({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = color ?? Theme.of(context).primaryColor;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: _color,
        ),
        borderRadius: BorderRadius.circular(10),
        color: _color,
      ),
      child: text,
    );
  }
}
