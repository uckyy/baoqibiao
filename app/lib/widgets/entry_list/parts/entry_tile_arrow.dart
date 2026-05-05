import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EntryTileArrow extends StatelessWidget {
  const EntryTileArrow();

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.chevronRight,
      size: 14,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }
}
