import 'package:azlistview/azlistview.dart';
import '../../models/entry.dart';

class AzEntryAdapter extends ISuspensionBean {
  final Entry entry;

  AzEntryAdapter({required this.entry}) {
    suspensionTag = entry.letterMark;
  }

  @override
  String getSuspensionTag() => suspensionTag;
}
