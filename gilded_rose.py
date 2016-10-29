import sell_in
import quality_factory


class Item(object):
    def __init__(self, name, quality, sell_in):
        self.name = name
        self.quality = quality
        self.sell_in = sell_in


def update_quality(items):
    for item in items:
        quality_factory.get(item.name).update_quality(item)
        sell_in.update(item)
