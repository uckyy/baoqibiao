from ..serializers.detail_serializer import build_detail_response
from ..utils.validators import parse_int_required, parse_int, ParamError
from ..utils.response_helpers import ok, bad_request, not_found


def entry_detail(request):
    try:
        entry_code = parse_int_required(request.GET.get("entryCode"), "entryCode")
        lane_code = parse_int(request.GET.get("laneCode"), 1)
        rhythm_code = parse_int(request.GET.get("rhythmCode"), 1)
    except ParamError as e:
        return bad_request(str(e))

    detail = build_detail_response(entry_code, lane_code, rhythm_code)
    if detail is None:
        return not_found()

    return ok(detail)
