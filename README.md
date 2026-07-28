# Sudoku

A polished, production **Flutter** Sudoku game — live on Google Play. Four ways to play, five calibrated difficulty tiers, ~30 languages, ranked championships with cross-platform leaderboards, and the small touches (combos, achievements, haptics, confetti) that make a simple game feel finished.

**[▶ Google Play](https://play.google.com/store/apps/details?id=com.sudoku.uzor)** · **[Portfolio](https://uzorgame.github.io/)**

<!-- TODO: add 2–3 screenshots or a short GIF here, e.g. ![gameplay](docs/screenshot-1.png) -->

## How it's built — engineering highlights

- **State management** — Provider / `ChangeNotifier`, composed in `main.dart` via `MultiProvider`: `AppState` (game + progress), `ChampionshipModel` (ranked play + persistence), `AchievementController`, `UndoRewardController`. Bootstrap runs an async load behind a post-frame callback so the first frame isn't blocked.
- **Cross-platform leaderboards** — one leaderboard interface with conditional `io` / `web` storage backends (`leaderboard_storage_io.dart` / `leaderboard_storage_web.dart`) picked at compile time, so the same championship code runs on mobile and on the web.
- **~30 languages** — full localization through Flutter's ARB / `gen_l10n` pipeline (en, uk, de, es, fr, it, pt, pl, tr, ja, ko, zh, hi and more).
- **Curated puzzle bank** — puzzles are hand-tuned and grouped into five difficulty tiers, each stored as `board` + `solution` (100–200 puzzles per tier), so difficulty stays consistent instead of leaning on random fills.
- **Rewarded mechanics, isolated** — optional rewarded ads for extra lives / undos live in their own controllers (`life_ad_controller`, `undo_reward_controller`, `ads/`), kept out of the core game logic.
- **Feel** — combo system, achievements, victory confetti, haptic feedback, responsive layout scaling, and multiple color themes.

## Game modes

1. **Classic** — standard play with difficulty selection.
2. **Daily Challenge** — one shared puzzle per day, available for 24 hours, with a calendar of past days.
3. **Battle (1-v-1)** — competitive mode; pick a flag for your profile.
4. **Championship** — global ranked competition with persistent leaderboards.

## Difficulty tiers

Five calibrated tiers (a **curated** bank, not random generation, so quality is consistent):

| Tier | Pre-filled cells | Puzzles |
|------|:---:|:---:|
| Novice | 38–42 | 100 |
| Medium | 32–36 | 100 |
| High | 26–30 | 100 |
| Expert | 22–25 | 200 |
| Master | 17–21 | 200 |

## Gameplay features

- **Lives & hints** — 3 lives per game; 1 free hint (more via rewarded ads).
- **Scoring & ranks** — points per correct move, a rank that grows as you solve.
- **Combos** — bonuses and visual badges for streaks of correct moves.
- **Notes mode**, **undo**, **restart**, identical-digit highlighting.
- **Achievements** — 50/100 wins, no-mistakes, no-hints, daily streaks, fast solves.
- **Statistics** — games/wins per tier, best time, current/max streak, battle win-rate, stars, daily streak.
- **Personalization** — themes (white, black, cream, green), languages, sound, vibration, font size.
- **Progress saving** — auto-save and resume, persisted stats and achievements.

## Tech

Flutter · Dart · Provider · shared_preferences · flutter_localizations / intl · flutter_svg · url_launcher · vibration · Firebase Analytics · Google Mobile Ads

Targets: Android · iOS · Web · Windows · macOS · Linux

## Run

```bash
flutter pub get
flutter run
```

## Project structure

```
lib/
  main.dart                # MultiProvider bootstrap + async load
  models.dart              # AppState + game models
  puzzles.dart             # curated puzzle bank by difficulty
  game_page.dart           # board + controls
  home_screen.dart         # menu / mode selection
  battle/                  # 1-v-1 mode (flags, avatars)
  championship/            # ranked mode + leaderboard storage (io / web)
  combo/                   # combo controller, theme, toasts
  controllers/             # achievements
  widgets/                 # board, control panel, dialogs
  ui/effects/              # victory confetti
  flutter_gen/gen_l10n/    # ~30 localizations
```

---

Developed by **Nahreba Mykhailo** — [portfolio](https://uzorgame.github.io/) · NagrebaMM@gmail.com
