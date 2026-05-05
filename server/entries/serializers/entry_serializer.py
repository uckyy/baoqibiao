from ..services.entry_service import filter_entries, chip_labels


def build_entries_response(lane_code, rhythm_code, rank_start, rank_end):
    filtered = filter_entries(rank_start, rank_end)
    items = []
    for entry in filtered:
        item = dict(entry)
        item["chipTexts"] = chip_labels(
            entry["entryCode"], lane_code, rhythm_code, entry["rankValue"],
        )
        items.append(item)
    return {"items": items}
