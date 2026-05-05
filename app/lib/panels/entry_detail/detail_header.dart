import 'package:flutter/material.dart';
import '../../models/entry_detail.dart';
import 'parts/detail_header_title.dart';
import 'parts/detail_header_chips.dart';

class DetailHeader extends StatelessWidget {
  final EntryDetail detail;

  const DetailHeader({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailHeaderTitle(detail: detail),
          const SizedBox(height: 8),
          DetailHeaderChips(detail: detail),
        ],
      ),
    );
  }
}
