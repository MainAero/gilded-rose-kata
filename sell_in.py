def update(item):
    item.sell_in = get_sell_in(item)
    return item


def get_sell_in(item):
    if item.name == 'Sulfuras, Hand of Ragnaros':
        return item.sell_in
    return item.sell_in - 1
