import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'form_parts/screenshot_picker.dart';
import 'form_parts/submit_button.dart';

class DetailFeedbackForm extends StatefulWidget {
  final VoidCallback onSubmit;
  final bool isSubmitting;

  const DetailFeedbackForm({
    required this.onSubmit,
    this.isSubmitting = false,
  });

  @override
  State<DetailFeedbackForm> createState() => DetailFeedbackFormState();
}

class DetailFeedbackFormState extends State<DetailFeedbackForm> {
  final _controller = TextEditingController();
  String? _screenshotPath;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickScreenshot() async {
    try {
      const typeGroup = XTypeGroup(
        label: "images",
        extensions: ["jpg", "png", "jpeg"],
      );
      final file = await openFile(acceptedTypeGroups: [typeGroup]);
      if (file != null) {
        setState(() => _screenshotPath = file.path);
      }
    } catch (_) {}
  }

  String get feedbackText => _controller.text.trim();
  String? get screenshotPath => _screenshotPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: "输入反馈内容...",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ScreenshotPicker(
              path: _screenshotPath,
              disabled: widget.isSubmitting,
              onPicked: _pickScreenshot,
            ),
            const Spacer(),
            SubmitButton(
              disabled: widget.isSubmitting,
              onPressed: widget.onSubmit,
            ),
          ],
        ),
      ],
    );
  }
}
