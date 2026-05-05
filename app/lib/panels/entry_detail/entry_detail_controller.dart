import 'package:flutter/foundation.dart';
import '../../models/entry_detail.dart';
import '../../network/api_client.dart';
import '../../network/entry_detail_api.dart';
import '../../network/feedback_api.dart';

class EntryDetailController extends ChangeNotifier {
  final EntryDetailApi _detailApi;
  final FeedbackApi _feedbackApi;

  EntryDetail? _detail;
  bool _isLoading = true;
  String? _error;
  bool _isSubmitting = false;

  EntryDetailController({required ApiClient client})
      : _detailApi = EntryDetailApi(client),
        _feedbackApi = FeedbackApi(client);

  EntryDetail? get detail => _detail;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isSubmitting => _isSubmitting;

  Future<void> loadDetail(int entryCode, int laneCode, int rhythmCode) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _detail = await _detailApi.fetch(
        entryCode: entryCode,
        laneCode: laneCode,
        rhythmCode: rhythmCode,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> submitFeedback(String text, String? filePath) async {
    _isSubmitting = true;
    notifyListeners();

    try {
      await _feedbackApi.submit(text: text, filePath: filePath);
      return true;
    } catch (_) {
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }
}
