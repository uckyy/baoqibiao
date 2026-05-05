class LaneInfo {
  final int laneCode;
  final String laneLabel;

  const LaneInfo({required this.laneCode, required this.laneLabel});

  factory LaneInfo.fromJson(Map<String, dynamic> json) {
    return LaneInfo(
      laneCode: json["laneCode"] as int,
      laneLabel: json["laneLabel"] as String,
    );
  }
}
