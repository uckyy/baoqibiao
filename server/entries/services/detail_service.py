from ..repository.detail_data import build_detail
from .entry_service import chip_labels


def build_entry_detail_response(entry_code, lane_code, rhythm_code):
    detail = build_detail(entry_code)
    if detail is None:
        return None
    result = dict(detail)
    result["chipTexts"] = chip_labels(
        entry_code, lane_code, rhythm_code, detail["rankValue"],
    )
    return result
