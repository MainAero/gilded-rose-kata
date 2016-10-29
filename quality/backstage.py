from quality import helper


def update_quality(item):
    return helper.set_quality(item, get_quality(item))


def get_quality(item, calc=lambda x: x+1):
    if item.sell_in < 1:
        return 0
    quality = calc(item.quality)
    if item.sell_in < 11:
        quality = calc(quality)
    if item.sell_in < 6:
        quality = calc(quality)
    return quality
