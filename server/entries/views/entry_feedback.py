from django.views.decorators.csrf import csrf_exempt
from ..utils.response_helpers import ok, method_not_allowed


@csrf_exempt
def entry_feedback(request):
    if request.method != "POST":
        return method_not_allowed()
    return ok({"status": "ok", "message": "反馈已收到"})
