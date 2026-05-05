from ..serializers.entry_serializer import build_entries_response
from ..utils.validators import parse_int, ParamError
from ..utils.response_helpers import ok, bad_request


def entries(request):
    try:
        lane_code = parse_int(request.GET.get("laneCode"), 1)
        rhythm_code = parse_int(request.GET.get("rhythmCode"), 1)
        rank_start = parse_int(request.GET.get("rankStart"), 1)
        rank_end = parse_int(request.GET.get("rankEnd"), 10)
    except ParamError:
        return bad_request("invalid params")

    return ok(build_entries_response(lane_code, rhythm_code, rank_start, rank_end))
