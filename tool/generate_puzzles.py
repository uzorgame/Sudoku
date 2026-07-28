#!/usr/bin/env python3
import math
import random
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Sequence, Tuple

BASE = 3
SIDE = BASE * BASE
BOARD_CELLS = SIDE * SIDE


def pattern(row: int, col: int) -> int:
    return (BASE * (row % BASE) + row // BASE + col) % SIDE


def shuffled(seq: Iterable[int]) -> List[int]:
    seq = list(seq)
    return random.sample(seq, len(seq))


def generate_solution() -> List[int]:
    rows = [g * BASE + r for g in shuffled(range(BASE)) for r in shuffled(range(BASE))]
    cols = [g * BASE + c for g in shuffled(range(BASE)) for c in shuffled(range(BASE))]
    nums = shuffled(range(1, SIDE + 1))
    return [nums[pattern(r, c)] for r in rows for c in cols]


def count_solutions(board: List[int], limit: int = 2) -> int:
    rows = [set() for _ in range(SIDE)]
    cols = [set() for _ in range(SIDE)]
    boxes = [set() for _ in range(SIDE)]

    for index, value in enumerate(board):
        if value == 0:
            continue
        row = index // SIDE
        col = index % SIDE
        box = (row // BASE) * BASE + col // BASE
        rows[row].add(value)
        cols[col].add(value)
        boxes[box].add(value)

    count = 0

    def search() -> None:
        nonlocal count
        if count >= limit:
            return

        best_candidates: List[int] | None = None
        best_index = -1

        for index, value in enumerate(board):
            if value != 0:
                continue
            row = index // SIDE
            col = index % SIDE
            box = (row // BASE) * BASE + col // BASE
            used = rows[row] | cols[col] | boxes[box]
            candidates = [n for n in range(1, SIDE + 1) if n not in used]
            if not candidates:
                return
            if best_candidates is None or len(candidates) < len(best_candidates):
                best_candidates = candidates
                best_index = index
                if len(best_candidates) == 1:
                    break

        if best_candidates is None:
            count += 1
            return

        row = best_index // SIDE
        col = best_index % SIDE
        box = (row // BASE) * BASE + col // BASE

        for value in best_candidates:
            board[best_index] = value
            rows[row].add(value)
            cols[col].add(value)
            boxes[box].add(value)
            search()
            board[best_index] = 0
            rows[row].remove(value)
            cols[col].remove(value)
            boxes[box].remove(value)
            if count >= limit:
                return

    search()
    return count


def check_distribution(board: List[int]) -> bool:
    """Перевіряє розподіл заповнених клітинок по секторам 3x3."""
    box_counts = [0] * SIDE
    for index, value in enumerate(board):
        if value != 0:
            row = index // SIDE
            col = index % SIDE
            box = (row // BASE) * BASE + col // BASE
            box_counts[box] += 1
    
    # Перевіряємо, що в кожному секторі є хоча б 2 заповнені клітинки
    # (для уникнення занадто порожніх секторів)
    min_per_box = 2
    return all(count >= min_per_box for count in box_counts)


def make_puzzle(solution: List[int], givens_range: Tuple[int, int], *, attempts: int = 20) -> List[int] | None:
    """Генерує головоломку з покращеною перевіркою якості."""
    for _ in range(attempts):
        target_givens = random.randint(givens_range[0], givens_range[1])
        empties_target = BOARD_CELLS - target_givens
        board = solution[:]
        positions = list(range(BOARD_CELLS))
        random.shuffle(positions)
        removed = 0

        for pos in positions:
            if removed >= empties_target:
                break
            if board[pos] == 0:
                continue
            saved = board[pos]
            board[pos] = 0
            if count_solutions(board, limit=2) == 1:
                removed += 1
            else:
                board[pos] = saved

        if removed >= empties_target:
            # Додаткова перевірка розподілу для покращення якості
            if check_distribution(board):
                return board
    return None


def chunked(values: Sequence[int]) -> Iterable[Sequence[int]]:
    for start in range(0, len(values), SIDE):
        yield values[start : start + SIDE]


def format_board(board: Sequence[int], indent: str = "        ") -> List[str]:
    lines: List[str] = []
    for row in chunked(board):
        lines.append(
            f"{indent}{row[0]},{row[1]},{row[2]}, {row[3]},{row[4]},{row[5]}, {row[6]},{row[7]},{row[8]},"
        )
    return lines


@dataclass
class DifficultyConfig:
    name: str
    dart_enum: str
    givens: Tuple[int, int]


def build_output(data: Dict[str, List[Tuple[List[int], List[int]]]], configs: List[DifficultyConfig]) -> str:
    lines: List[str] = [
        "import 'models.dart';",
        "",
        "/// Класс одной головоломки судоку",
        "class Puzzle {",
        "  final List<int> board;    // стартовая доска (0 = пустая клетка)",
        "  final List<int> solution; // правильное решение",
        "",
        "  const Puzzle(this.board, this.solution);",
        "}",
        "",
        "/// Коллекция судоку по уровням сложности.",
        "final Map<Difficulty, List<Puzzle>> puzzles = {",
    ]

    for config in configs:
        lines.append(f"  {config.dart_enum}: [")
        entries = data.get(config.name, [])
        for puzzle_board, solution in entries:
            lines.append("    Puzzle(")
            lines.append("      [")
            lines.extend(format_board(puzzle_board, indent="        "))
            lines.append("      ],")
            lines.append("      [")
            lines.extend(format_board(solution, indent="        "))
            lines.append("      ],")
            lines.append("    ),")
        lines.append("  ],")
    lines.append("};")
    lines.append("")
    return "\n".join(lines)


def main() -> None:
    random.seed(20240917)
    # Покращена градація з більш вузькими діапазонами для кращої якості
    configs = [
        DifficultyConfig("novice", "Difficulty.novice", (38, 42)),  # 47-52% заповнено
        DifficultyConfig("medium", "Difficulty.medium", (32, 36)),  # 40-44% заповнено
        DifficultyConfig("high", "Difficulty.high", (26, 30)),     # 32-37% заповнено
        DifficultyConfig("expert", "Difficulty.expert", (22, 25)),   # 27-31% заповнено
        DifficultyConfig("master", "Difficulty.master", (17, 21)),   # 21-26% заповнено
    ]
    
    # Різна кількість головоломок для різних рівнів
    targets = {
        "novice": 100,
        "medium": 100,
        "high": 100,
        "expert": 200,  # Збільшено для складних рівнів
        "master": 200,  # Збільшено для складних рівнів
    }

    puzzles: Dict[str, List[Tuple[List[int], List[int]]]] = {cfg.name: [] for cfg in configs}
    seen: set[Tuple[int, ...]] = set()

    attempts = 0
    while any(len(puzzles[cfg.name]) < targets[cfg.name] for cfg in configs):
        attempts += 1
        solution = generate_solution()
        for cfg in configs:
            if len(puzzles[cfg.name]) >= targets[cfg.name]:
                continue
            # Більше спроб для складніших рівнів
            max_attempts = 8 if cfg.name in ("expert", "master") else 5
            for _ in range(max_attempts):
                puzzle = make_puzzle(solution, cfg.givens)
                if puzzle is None:
                    continue
                key = tuple(puzzle)
                if key in seen:
                    continue
                seen.add(key)
                puzzles[cfg.name].append((puzzle, solution[:]))
                break
        if attempts % 25 == 0:
            status = ", ".join(f"{cfg.name}: {len(puzzles[cfg.name])}/{targets[cfg.name]}" for cfg in configs)
            print(f"Progress after {attempts} seeds -> {status}")

    output = build_output(puzzles, configs)
    Path("lib").mkdir(parents=True, exist_ok=True)
    Path("lib/puzzles.dart").write_text(output)
    total = sum(len(v) for v in puzzles.values())
    print(f"Generated lib/puzzles.dart with {total} puzzles")
    print("Distribution:", {cfg.name: len(puzzles[cfg.name]) for cfg in configs})


if __name__ == "__main__":
    main()
