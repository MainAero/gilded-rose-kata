class Item(object):
    def __init__(self, name, quality, sell_in):
        self.name = name
        self.quality = quality
        self.sell_in = sell_in


def update_quality(items):
    for item in items:
        if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert':
            if item.quality > 0:
                if item.name != 'Sulfuras, Hand of Ragnaros':
                    item.quality -= 1
        else:
            if item.quality < 50:
                item.quality += 1
                if item.name == 'Backstage passes to a TAFKAL80ETC concert':
                    if item.sell_in < 11:
                        if item.quality < 50:
                            item.quality += 1

                    if item.sell_in < 6:
                        if item.quality < 50:
                            item.quality += 1

        if item.name != 'Sulfuras, Hand of Ragnaros':
            item.sell_in -= 1

        if item.sell_in < 0:
            if item.name != "Aged Brie":
                if item.name != 'Backstage passes to a TAFKAL80ETC concert':
                    if item.quality > 0:
                        if item.name != 'Sulfuras, Hand of Ragnaros':
                            item.quality -= 1
                else:
                    item.quality = item.quality - item.quality

            else:
                if item.quality < 50:
                    item.quality += 1
