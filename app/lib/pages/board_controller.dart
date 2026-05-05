import 'package:flutter/foundation.dart';
import '../models/filter_board.dart';
import '../models/entry.dart';
import '../models/rank_band.dart';
import '../network/api_client.dart';
import '../network/filter_board_api.dart';
import '../network/entries_api.dart';

class BoardController extends ChangeNotifier {
  final FilterBoardApi _filterApi;
  final EntriesApi _entriesApi;

  FilterBoard? _filterBoard;
  List<Entry> _entries = [];
  bool _isLoadingFilter = true;
  bool _isLoadingEntries = false;
  String? _filterError;
  String? _entriesError;

  int _laneCode = 1;
  int _rhythmCode = 1;
  int _rankStart = 1;
  int _rankEnd = 10;

  BoardController({required ApiClient client})
      : _filterApi = FilterBoardApi(client),
        _entriesApi = EntriesApi(client);

  FilterBoard? get filterBoard => _filterBoard;
  List<Entry> get entries => _entries;
  bool get isLoadingFilter => _isLoadingFilter;
  bool get isLoadingEntries => _isLoadingEntries;
  String? get filterError => _filterError;
  String? get entriesError => _entriesError;
  int get laneCode => _laneCode;
  int get rhythmCode => _rhythmCode;
  int get rankStart => _rankStart;
  int get rankEnd => _rankEnd;

  Future<void> loadFilterBoard() async {
    _isLoadingFilter = true;
    _filterError = null;
    notifyListeners();

    try {
      _filterBoard = await _filterApi.fetch();
      await _loadEntries();
    } catch (e) {
      _filterError = e.toString();
    } finally {
      _isLoadingFilter = false;
      notifyListeners();
    }
  }

  Future<void> _loadEntries() async {
    _isLoadingEntries = true;
    _entriesError = null;
    notifyListeners();

    try {
      _entries = await _entriesApi.fetch(
        laneCode: _laneCode,
        rhythmCode: _rhythmCode,
        rankStart: _rankStart,
        rankEnd: _rankEnd,
      );
    } catch (e) {
      _entriesError = e.toString();
    } finally {
      _isLoadingEntries = false;
      notifyListeners();
    }
  }

  void setLane(int code) {
    if (_laneCode == code) return;
    _laneCode = code;
    _loadEntries();
  }

  void setRhythm(int code) {
    if (_rhythmCode == code) return;
    _rhythmCode = code;
    _loadEntries();
  }

  void setRank(RankBand band) {
    if (_rankStart == band.rankStart && _rankEnd == band.rankEnd) return;
    _rankStart = band.rankStart;
    _rankEnd = band.rankEnd;
    _loadEntries();
  }

  void retryEntries() => _loadEntries();
  void retryFilter() => loadFilterBoard();
}
