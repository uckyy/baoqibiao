class Entry {
  final int entryCode;
  final String entryTitle;
  final String artistAlias;
  final String letterMark;
  final int rankValue;
  final int tempoValue;
  final List<String> chipTexts;

  const Entry({
    required this.entryCode,
    required this.entryTitle,
    required this.artistAlias,
    required this.letterMark,
    required this.rankValue,
    required this.tempoValue,
    required this.chipTexts,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      entryCode: json["entryCode"] as int,
      entryTitle: json["entryTitle"] as String,
      artistAlias: json["artistAlias"] as String,
      letterMark: json["letterMark"] as String,
      rankValue: json["rankValue"] as int,
      tempoValue: json["tempoValue"] as int,
      chipTexts: (json["chipTexts"] as List).cast<String>(),
    );
  }
}
