import 'package:flutter/material.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function onTap;
  final bool active;

  PageTile({this.label, this.iconData, this.onTap, @required this.active});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = active ? theme.primaryColor : Colors.black54;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      title: SimpleText(
        label,
        size: 16,
        color: color,
        bold: true,
      ),
      leading: Icon(iconData, color: color),
      onTap: onTap,
    );
  }
}
