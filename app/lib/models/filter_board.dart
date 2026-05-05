import 'lane_info.dart';
import 'rhythm_info.dart';
import 'rank_band.dart';

class FilterBoard {
  final List<LaneInfo> lanes;
  final List<RhythmInfo> rhythms;
  final List<RankBand> rankBands;

  const FilterBoard({
    required this.lanes,
    required this.rhythms,
    required this.rankBands,
  });

  factory FilterBoard.fromJson(Map<String, dynamic> json) {
    return FilterBoard(
      lanes: (json["lanes"] as List)
          .map((e) => LaneInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      rhythms: (json["rhythms"] as List)
          .map((e) => RhythmInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      rankBands: (json["rankBands"] as List)
          .map((e) => RankBand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
