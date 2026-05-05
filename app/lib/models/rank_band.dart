class RankBand {
  final int rankStart;
  final int rankEnd;
  final String rankLabel;

  const RankBand({
    required this.rankStart,
    required this.rankEnd,
    required this.rankLabel,
  });

  factory RankBand.fromJson(Map<String, dynamic> json) {
    return RankBand(
      rankStart: json["rankStart"] as int,
      rankEnd: json["rankEnd"] as int,
      rankLabel: json["rankLabel"] as String,
    );
  }
}
