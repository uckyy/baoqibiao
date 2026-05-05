class DetailSegment {
  final String segmentTitle;
  final String startText;
  final String endText;
  final String hintText;
  final String memoText;

  const DetailSegment({
    required this.segmentTitle,
    required this.startText,
    required this.endText,
    required this.hintText,
    required this.memoText,
  });

  factory DetailSegment.fromJson(Map<String, dynamic> json) {
    return DetailSegment(
      segmentTitle: json["segmentTitle"] as String,
      startText: json["startText"] as String,
      endText: json["endText"] as String,
      hintText: json["hintText"] as String,
      memoText: json["memoText"] as String,
    );
  }
}
