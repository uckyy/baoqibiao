class RhythmInfo {
  final int rhythmCode;
  final String rhythmLabel;

  const RhythmInfo({required this.rhythmCode, required this.rhythmLabel});

  factory RhythmInfo.fromJson(Map<String, dynamic> json) {
    return RhythmInfo(
      rhythmCode: json["rhythmCode"] as int,
      rhythmLabel: json["rhythmLabel"] as String,
    );
  }
}
