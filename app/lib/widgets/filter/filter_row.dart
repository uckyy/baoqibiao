import 'package:flutter/material.dart';
import 'filter_chip_item.dart';

class FilterRow extends StatelessWidget {
  final List<String> labels;
  final List<int> codes;
  final int? selectedCode;
  final ValueChanged<int> onSelected;

  const FilterRow({
    required this.labels,
    required this.codes,
    required this.selectedCode,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        itemCount: labels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return FilterChipItem(
            label: labels[index],
            isSelected: selectedCode == codes[index],
            onTap: () => onSelected(codes[index]),
          );
        },
      ),
    );
  }
}
