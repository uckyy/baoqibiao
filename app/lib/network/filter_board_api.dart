import '../models/filter_board.dart';
import 'api_client.dart';
import 'api_endpoints.dart';

class FilterBoardApi {
  final ApiClient _client;

  const FilterBoardApi(this._client);

  Future<FilterBoard> fetch() async {
    final json = await _client.get(ApiEndpoints.filterBoard);
    return FilterBoard.fromJson(json);
  }
}
