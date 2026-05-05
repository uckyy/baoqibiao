import 'package:flutter/material.dart';
import '../../models/rank_band.dart';

class FilterRankRow extends StatelessWidget {
  final List<RankBand> bands;
  final int selectedRankStart;
  final int selectedRankEnd;
  final ValueChanged<RankBand> onChanged;

  const FilterRankRow({
    required this.bands,
    required this.selectedRankStart,
    required this.selectedRankEnd,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        itemCount: bands.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final band = bands[index];
          final isSelected =
              selectedRankStart == band.rankStart && selectedRankEnd == band.rankEnd;
          final theme = Theme.of(context);
          return ChoiceChip(
            label: Text(
              band.rankLabel,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? theme.colorScheme.onPrimaryContainer : null,
              ),
            ),
            selected: isSelected,
            onSelected: (_) => onChanged(band),
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          );
        },
      ),
    );
  }
}
