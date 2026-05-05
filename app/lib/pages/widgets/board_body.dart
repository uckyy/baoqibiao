import 'package:flutter/material.dart';
import '../../models/filter_board.dart';
import '../../models/rank_band.dart';
import '../../models/entry.dart';
import '../../widgets/filter/filter_strip.dart';
import '../../widgets/entry_list/indexed_entry_list.dart';
import '../../panels/entry_detail/entry_detail_panel.dart';
import '../../network/api_client.dart';

class BoardBody extends StatelessWidget {
  final FilterBoard filterBoard;
  final List<Entry> entries;
  final int selectedLaneCode;
  final int selectedRhythmCode;
  final int selectedRankStart;
  final int selectedRankEnd;
  final bool isLoadingEntries;
  final String? entriesError;
  final ApiClient apiClient;
  final void Function(int) onLaneChanged;
  final void Function(int) onRhythmChanged;
  final void Function(RankBand) onRankChanged;
  final VoidCallback onRetryEntries;

  const BoardBody({
    required this.filterBoard,
    required this.entries,
    required this.selectedLaneCode,
    required this.selectedRhythmCode,
    required this.selectedRankStart,
    required this.selectedRankEnd,
    required this.isLoadingEntries,
    required this.entriesError,
    required this.apiClient,
    required this.onLaneChanged,
    required this.onRhythmChanged,
    required this.onRankChanged,
    required this.onRetryEntries,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterStrip(
          lanes: filterBoard.lanes,
          rhythms: filterBoard.rhythms,
          rankBands: filterBoard.rankBands,
          selectedLaneCode: selectedLaneCode,
          selectedRhythmCode: selectedRhythmCode,
          selectedRankStart: selectedRankStart,
          selectedRankEnd: selectedRankEnd,
          onLaneChanged: onLaneChanged,
          onRhythmChanged: onRhythmChanged,
          onRankChanged: onRankChanged,
        ),
        const Divider(height: 1),
        Expanded(
          child: IndexedEntryList(
            entries: entries,
            onEntryTap: (entry) => _openDetail(context, entry),
            isLoading: isLoadingEntries,
            errorMessage: entriesError,
            onRetry: onRetryEntries,
          ),
        ),
      ],
    );
  }

  void _openDetail(BuildContext context, Entry entry) {
    showDialog(
      context: context,
      builder: (_) => EntryDetailPanel(
        entryCode: entry.entryCode,
        laneCode: selectedLaneCode,
        rhythmCode: selectedRhythmCode,
        client: apiClient,
      ),
    );
  }
}
