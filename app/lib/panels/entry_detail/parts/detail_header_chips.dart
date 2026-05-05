import 'package:flutter/material.dart';
import '../../models/entry_detail.dart';

class DetailHeaderChips extends StatelessWidget {
  final EntryDetail detail;

  const DetailHeaderChips({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      children: detail.chipTexts.map((text) {
        return Chip(
          label: Text(text, style: const TextStyle(fontSize: 11)),
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      }).toList(),
    );
  }
}
