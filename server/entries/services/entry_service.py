from ..constants import LANES, RHYTHMS
from ..repository.entry_data import all_entries


def chip_labels(entry_code, lane_code, rhythm_code, rank_value):
    li = (entry_code + lane_code) % len(LANES)
    ri = (entry_code + rhythm_code) % len(RHYTHMS)
    return [
        LANES[li]["laneLabel"],
        RHYTHMS[ri]["rhythmLabel"],
        f"星{rank_value}",
    ]


def filter_entries(rank_start, rank_end):
    return [
        e for e in all_entries()
        if rank_start <= e["rankValue"] <= rank_end
    ]
