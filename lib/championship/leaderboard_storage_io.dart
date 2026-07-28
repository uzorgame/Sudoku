import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'leaderboard_storage.dart';

class FileChampionshipLeaderboardStorage
    extends ChampionshipLeaderboardStorage {
  FileChampionshipLeaderboardStorage();

  File? _file;

  Future<File> _resolveFile() async {
    final cached = _file;
    if (cached != null) {
      return cached;
    }
    final directory = await getApplicationSupportDirectory();
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    final file = File('${directory.path}/championship_leaderboard.json');
    _file = file;
    return file;
  }

  @override
  Future<String?> read() async {
    final file = await _resolveFile();
    if (!await file.exists()) {
      return null;
    }
    try {
      return await file.readAsString();
    } on IOException {
      return null;
    }
  }

  @override
  Future<void> write(String contents) async {
    final file = await _resolveFile();
    await file.writeAsString(contents, flush: true);
  }

  @override
  Future<void> delete() async {
    final file = await _resolveFile();
    if (await file.exists()) {
      await file.delete();
    }
  }
}

ChampionshipLeaderboardStorage createLeaderboardStorageImpl() =>
    FileChampionshipLeaderboardStorage();
