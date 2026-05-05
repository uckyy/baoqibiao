from django.http import JsonResponse


def ok(data=None):
    return JsonResponse(data or {})


def bad_request(message):
    return JsonResponse({"error": message}, status=400)


def not_found(message="not found"):
    return JsonResponse({"error": message}, status=404)


def method_not_allowed():
    return JsonResponse({"error": "POST required"}, status=405)
