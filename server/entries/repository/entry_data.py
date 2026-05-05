_CACHE = None


def _generate():
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    items = []
    code = 1000
    for letter in LETTERS:
        for index in range(1, 13):
            code += 1
            rank = code % 10 + 1
            items.append({
                "entryCode": code,
                "entryTitle": f"{letter} 条目 {index:02d}",
                "artistAlias": "Unknown Artist",
                "letterMark": letter,
                "rankValue": rank,
                "tempoValue": 120 + code % 60,
                "chipTexts": ["标签", f"星{rank}"],
            })
    return items


def all_entries():
    global _CACHE
    if _CACHE is None:
        _CACHE = _generate()
    return _CACHE


def find_by_code(entry_code):
    for e in all_entries():
        if e["entryCode"] == entry_code:
            return e
    return None
