from ..serializers.filter_board_serializer import build_filter_board
from ..utils.response_helpers import ok


def filter_board(request):
    return ok(build_filter_board())
