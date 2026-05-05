import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EntryAvatar extends StatelessWidget {
  final double size;

  const EntryAvatar({this.size = 44});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(
        FontAwesomeIcons.music,
        size: size / 2,
        color: theme.colorScheme.onPrimaryContainer,
      ),
    );
  }
}
