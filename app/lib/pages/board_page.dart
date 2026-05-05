import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter_ime/flutter_ime.dart';
import '../network/api_client.dart';
import '../widgets/shared/loading_view.dart';
import '../widgets/shared/error_view.dart';
import 'widgets/board_app_bar.dart';
import 'widgets/board_body.dart';
import 'board_controller.dart';

class BoardPage extends StatefulWidget {
  final ApiClient client;

  const BoardPage({required this.client});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  late final BoardController _controller;

  @override
  void initState() {
    super.initState();
    _initWakelock();
    _controller = BoardController(client: widget.client);
    _controller.addListener(_onChanged);
    _controller.loadFilterBoard();
  }

  @override
  void dispose() {
    _releaseWakelock();
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _initWakelock() async {
    await WakelockPlus.enable();
    await FlutterIme.dispose();
  }

  Future<void> _releaseWakelock() async {
    await WakelockPlus.disable();
    await FlutterIme.init();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: const BoardAppBar(),
      body: _controller.isLoadingFilter
          ? const LoadingView()
          : _controller.filterError != null
              ? ErrorView(
                  message: "加载失败: ${_controller.filterError}",
                  onRetry: _controller.retryFilter,
                )
              : BoardBody(
                  filterBoard: _controller.filterBoard!,
                  entries: _controller.entries,
                  selectedLaneCode: _controller.laneCode,
                  selectedRhythmCode: _controller.rhythmCode,
                  selectedRankStart: _controller.rankStart,
                  selectedRankEnd: _controller.rankEnd,
                  isLoadingEntries: _controller.isLoadingEntries,
                  entriesError: _controller.entriesError,
                  apiClient: widget.client,
                  onLaneChanged: _controller.setLane,
                  onRhythmChanged: _controller.setRhythm,
                  onRankChanged: _controller.setRank,
                  onRetryEntries: _controller.retryEntries,
                ),
    );
  }
}
