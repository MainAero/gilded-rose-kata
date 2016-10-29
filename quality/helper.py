def in_range(quality):
    return 50 > quality > 0


def default_quality(item, calc=lambda x: x-1):
    quality = calc(item.quality)
    if item.sell_in < 1:
        quality = calc(quality)
    return quality


def set_quality(item, quality):
    if in_range(item.quality):
        item.quality = min(quality, 50)
    return item
