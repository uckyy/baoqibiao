import 'package:flutter/material.dart';
import '../../models/entry_detail.dart';
import '../../widgets/detail/detail_block.dart';

class DetailSegmentsList extends StatelessWidget {
  final EntryDetail detail;

  const DetailSegmentsList({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: detail.segments.map((s) => DetailBlock(segment: s)).toList(),
    );
  }
}
