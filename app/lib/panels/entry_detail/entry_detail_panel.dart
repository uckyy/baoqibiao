import 'package:flutter/material.dart';
import '../../network/api_client.dart';
import '../../widgets/shared/loading_view.dart';
import '../../widgets/shared/error_view.dart';
import 'entry_detail_controller.dart';
import 'detail_header.dart';
import 'detail_segments_list.dart';
import 'detail_info_boxes.dart';
import 'detail_feedback_form.dart';

class EntryDetailPanel extends StatefulWidget {
  final int entryCode;
  final int laneCode;
  final int rhythmCode;
  final ApiClient client;

  const EntryDetailPanel({
    required this.entryCode,
    required this.laneCode,
    required this.rhythmCode,
    required this.client,
  });

  @override
  State<EntryDetailPanel> createState() => _EntryDetailPanelState();
}

class _EntryDetailPanelState extends State<EntryDetailPanel> {
  late final EntryDetailController _controller;
  final _formKey = GlobalKey<DetailFeedbackFormState>();

  @override
  void initState() {
    super.initState();
    _controller = EntryDetailController(client: widget.client);
    _controller.addListener(_onChanged);
    _controller.loadDetail(widget.entryCode, widget.laneCode, widget.rhythmCode);
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _submitFeedback() async {
    final form = _formKey.currentState;
    if (form == null) return;
    final ok = await _controller.submitFeedback(
      form.feedbackText,
      form.screenshotPath,
    );
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ok ? "反馈已提交" : "提交失败")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 520,
          maxHeight: screenHeight * 0.9,
        ),
        child: _controller.isLoading
            ? const LoadingView()
            : _controller.error != null
                ? ErrorView(
                    message: _controller.error!,
                    onRetry: () => _controller.loadDetail(
                      widget.entryCode,
                      widget.laneCode,
                      widget.rhythmCode,
                    ),
                  )
                : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final detail = _controller.detail!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailHeader(detail: detail),
        const Divider(height: 1),
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailSegmentsList(detail: detail),
                const SizedBox(height: 8),
                DetailInfoBoxes(detail: detail),
                const SizedBox(height: 16),
                DetailFeedbackForm(
                  key: _formKey,
                  onSubmit: _submitFeedback,
                  isSubmitting: _controller.isSubmitting,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
