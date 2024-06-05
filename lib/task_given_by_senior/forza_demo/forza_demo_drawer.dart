import 'package:flutter/material.dart';


class ForzaDemoDrawer extends StatelessWidget {
  const ForzaDemoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(elevation: 30,child: Column(children: [],),);
  }
}
class IconAndName extends StatelessWidget {
  final IconData _icon;
  final Text _text;
   IconAndName(this._icon,this._text,{super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(_icon),_text],);
  }
}
