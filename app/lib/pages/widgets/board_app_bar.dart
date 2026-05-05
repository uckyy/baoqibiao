import 'package:flutter/material.dart';

class BoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BoardAppBar({this.title = "谱面总览"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
