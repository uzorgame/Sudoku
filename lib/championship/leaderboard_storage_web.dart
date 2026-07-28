import 'package:shared_preferences/shared_preferences.dart';

import 'leaderboard_storage.dart';

class _WebChampionshipLeaderboardStorage
    extends ChampionshipLeaderboardStorage {
  static const _storageKey = 'championship.leaderboard.cache.v1';

  const _WebChampionshipLeaderboardStorage();

  @override
  Future<String?> read() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_storageKey);
  }

  @override
  Future<void> write(String contents) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageKey, contents);
  }

  @override
  Future<void> delete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}

ChampionshipLeaderboardStorage createLeaderboardStorageImpl() =>
    const _WebChampionshipLeaderboardStorage();
