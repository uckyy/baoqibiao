from .entry_data import find_by_code


def build_detail(entry_code):
    entry = find_by_code(entry_code)
    if entry is None:
        return None

    detail = dict(entry)
    detail["segments"] = [
        {
            "segmentTitle": "段落 1",
            "startText": "00:12",
            "endText": "00:28",
            "hintText": "推荐",
            "memoText": "本段为主要高亮段落，适合重点练习。",
        },
        {
            "segmentTitle": "段落 2",
            "startText": "00:42",
            "endText": "00:58",
            "hintText": "可选",
            "memoText": "本段为过渡段落，可根据需求选择性练习。",
        },
    ]
    detail["commonText"] = "提示：以上数据仅供参考，实际配置可能有所不同。"
    detail["summaryText"] = "总结：本条目适合作为练习参考。"
    return detail
