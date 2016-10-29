import helper


def update_quality(item):
    return helper.set_quality(
        item,
        helper.default_quality(item, lambda x: x+1)
    )
