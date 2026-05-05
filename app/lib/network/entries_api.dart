import '../models/entry.dart';
import 'api_client.dart';
import 'api_endpoints.dart';

class EntriesApi {
  final ApiClient _client;

  const EntriesApi(this._client);

  Future<List<Entry>> fetch({
    required int laneCode,
    required int rhythmCode,
    required int rankStart,
    required int rankEnd,
  }) async {
    final json = await _client.get(ApiEndpoints.entries, params: {
      "laneCode": laneCode.toString(),
      "rhythmCode": rhythmCode.toString(),
      "rankStart": rankStart.toString(),
      "rankEnd": rankEnd.toString(),
    });
    return (json["items"] as List)
        .map((e) => Entry.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
