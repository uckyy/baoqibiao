import '../models/entry_detail.dart';
import 'api_client.dart';
import 'api_endpoints.dart';

class EntryDetailApi {
  final ApiClient _client;

  const EntryDetailApi(this._client);

  Future<EntryDetail> fetch({
    required int entryCode,
    required int laneCode,
    required int rhythmCode,
  }) async {
    final json = await _client.get(ApiEndpoints.entryDetail, params: {
      "entryCode": entryCode.toString(),
      "laneCode": laneCode.toString(),
      "rhythmCode": rhythmCode.toString(),
    });
    return EntryDetail.fromJson(json);
  }
}
