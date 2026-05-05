import 'package:flutter/material.dart';
import '../../models/lane_info.dart';
import '../../models/rhythm_info.dart';
import '../../models/rank_band.dart';
import 'filter_row.dart';
import 'filter_rank_row.dart';

class FilterStrip extends StatelessWidget {
  final List<LaneInfo> lanes;
  final List<RhythmInfo> rhythms;
  final List<RankBand> rankBands;
  final int selectedLaneCode;
  final int selectedRhythmCode;
  final int selectedRankStart;
  final int selectedRankEnd;
  final ValueChanged<int> onLaneChanged;
  final ValueChanged<int> onRhythmChanged;
  final ValueChanged<RankBand> onRankChanged;

  const FilterStrip({
    required this.lanes,
    required this.rhythms,
    required this.rankBands,
    required this.selectedLaneCode,
    required this.selectedRhythmCode,
    required this.selectedRankStart,
    required this.selectedRankEnd,
    required this.onLaneChanged,
    required this.onRhythmChanged,
    required this.onRankChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surfaceContainerHighest,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterRow(
            labels: lanes.map((l) => l.laneLabel).toList(),
            codes: lanes.map((l) => l.laneCode).toList(),
            selectedCode: selectedLaneCode,
            onSelected: onLaneChanged,
          ),
          FilterRow(
            labels: rhythms.map((r) => r.rhythmLabel).toList(),
            codes: rhythms.map((r) => r.rhythmCode).toList(),
            selectedCode: selectedRhythmCode,
            onSelected: onRhythmChanged,
          ),
          FilterRankRow(
            bands: rankBands,
            selectedRankStart: selectedRankStart,
            selectedRankEnd: selectedRankEnd,
            onChanged: onRankChanged,
          ),
        ],
      ),
    );
  }
}
