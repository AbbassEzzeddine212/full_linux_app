import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key, this.leading, required this.title});
  final Widget? leading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leadingWidth: 75,
      leading: leading,

      actions: [Icon(Icons.notifications_none, size: 40)],
    );
  }

  // Required when making a custom AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
