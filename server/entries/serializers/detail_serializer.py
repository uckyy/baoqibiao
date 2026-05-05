from ..services.detail_service import build_entry_detail_response


def build_detail_response(entry_code, lane_code, rhythm_code):
    detail = build_entry_detail_response(entry_code, lane_code, rhythm_code)
    if detail is None:
        return None
    return detail
