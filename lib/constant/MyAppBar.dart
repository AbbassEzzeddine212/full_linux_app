import 'package:flutter/material.dart';
import 'package:full_app/Screen_Widgets/Notification/NotificationPage.dart';
import 'package:get/get.dart';

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

      actions: [IconButton(onPressed: ()=>Get.to(NotiPage()), icon: Icon(Icons.notifications_none,size: 40,))],
    );
  }

  // Required when making a custom AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
// Icon(Icons.notifications_none, size: 40)