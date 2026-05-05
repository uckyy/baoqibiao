import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'network/api_client.dart';
import 'pages/board_page.dart';

class EntryBoardApp extends StatefulWidget {
  const EntryBoardApp();

  @override
  State<EntryBoardApp> createState() => _EntryBoardAppState();
}

class _EntryBoardAppState extends State<EntryBoardApp> {
  late final ApiClient _client;

  @override
  void initState() {
    super.initState();
    _client = ApiClient();
  }

  @override
  void dispose() {
    _client.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "谱面总览",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: BoardPage(client: _client),
    );
  }
}
