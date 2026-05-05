import 'api_client.dart';
import 'api_endpoints.dart';

class FeedbackApi {
  final ApiClient _client;

  const FeedbackApi(this._client);

  Future<void> submit({required String text, String? filePath}) async {
    if (filePath != null) {
      await _client.postMultipart(
        ApiEndpoints.entryFeedback,
        fields: {"text": text},
        filePath: filePath,
      );
    } else {
      await _client.post(ApiEndpoints.entryFeedback, body: {"text": text});
    }
  }
}
