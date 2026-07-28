import 'leaderboard_storage_io.dart'
    if (dart.library.html) 'leaderboard_storage_web.dart';

abstract class ChampionshipLeaderboardStorage {
  const ChampionshipLeaderboardStorage();

  Future<String?> read();

  Future<void> write(String contents);

  Future<void> delete();
}

ChampionshipLeaderboardStorage createLeaderboardStorage() =>
    createLeaderboardStorageImpl();
