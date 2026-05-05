import 'detail_segment.dart';

class EntryDetail {
  final int entryCode;
  final String entryTitle;
  final String artistAlias;
  final int rankValue;
  final int tempoValue;
  final List<String> chipTexts;
  final List<DetailSegment> segments;
  final String commonText;
  final String summaryText;

  const EntryDetail({
    required this.entryCode,
    required this.entryTitle,
    required this.artistAlias,
    required this.rankValue,
    required this.tempoValue,
    required this.chipTexts,
    required this.segments,
    required this.commonText,
    required this.summaryText,
  });

  factory EntryDetail.fromJson(Map<String, dynamic> json) {
    return EntryDetail(
      entryCode: json["entryCode"] as int,
      entryTitle: json["entryTitle"] as String,
      artistAlias: json["artistAlias"] as String,
      rankValue: json["rankValue"] as int,
      tempoValue: json["tempoValue"] as int,
      chipTexts: (json["chipTexts"] as List).cast<String>(),
      segments: (json["segments"] as List)
          .map((e) => DetailSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      commonText: json["commonText"] as String,
      summaryText: json["summaryText"] as String,
    );
  }
}
