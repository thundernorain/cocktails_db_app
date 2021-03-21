import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Function()? onTap;

  const DrawerListTile(
      {Key? key, required this.leading, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      onTap: onTap,
    );
  }
}
