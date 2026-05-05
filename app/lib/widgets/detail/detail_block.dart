import 'package:flutter/material.dart';
import '../../models/detail_segment.dart';
import 'parts/detail_block_title.dart';
import 'parts/detail_block_time.dart';
import 'parts/detail_block_memo.dart';

class DetailBlock extends StatelessWidget {
  final DetailSegment segment;

  const DetailBlock({required this.segment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailBlockTitle(segment: segment),
            const SizedBox(height: 8),
            DetailBlockTime(segment: segment),
            DetailBlockMemo(segment: segment),
          ],
        ),
      ),
    );
  }
}
