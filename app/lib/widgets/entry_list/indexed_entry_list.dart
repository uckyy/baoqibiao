import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import '../../models/entry.dart';
import 'az_entry_adapter.dart';
import 'entry_tile.dart';
import '../shared/loading_view.dart';
import '../shared/error_view.dart';
import '../shared/empty_view.dart';

class IndexedEntryList extends StatelessWidget {
  final List<Entry> entries;
  final ValueChanged<Entry> onEntryTap;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onRetry;

  const IndexedEntryList({
    required this.entries,
    required this.onEntryTap,
    this.isLoading = false,
    this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const LoadingView();
    if (errorMessage != null) {
      return ErrorView(message: errorMessage!, onRetry: onRetry);
    }
    if (entries.isEmpty) return const EmptyView(message: "暂无条目");

    final list = entries.map((e) => AzEntryAdapter(entry: e)).toList();
    SuspensionUtil.setShowSuspensionStatus(list);

    return AzListView(
      data: list,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final adapter = list[index] as AzEntryAdapter;
        return EntryTile(
          entry: adapter.entry,
          onTap: () => onEntryTap(adapter.entry),
        );
      },
      suspensionWidget: _buildSuspensionWidget,
      isUseRealIndex: true,
      indexBarData: SuspensionUtil.getTagIndexList(list),
      indexBarOptions: const IndexBarOptions(
        needRebuild: true,
        ignoreDragCancel: true,
        selectTextStyle: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        selectItemDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildSuspensionWidget(String tag) {
    return Container(
      height: 32,
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      color: Colors.grey[200],
      child: Text(
        tag,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
