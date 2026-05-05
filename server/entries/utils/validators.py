class ParamError(Exception):
    pass


def parse_int(value, default):
    try:
        return int(value)
    except (TypeError, ValueError):
        if default is not None:
            return default
        raise ParamError("invalid int param")


def parse_int_required(value, name):
    try:
        return int(value)
    except (TypeError, ValueError):
        raise ParamError(f"{name} required and must be int")
