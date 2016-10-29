from quality import normal, sulfuras, backstage, aged_brie, conjured


qualities = {
    'NORMAL ITEM': normal,
    'Sulfuras, Hand of Ragnaros': sulfuras,
    'Backstage passes to a TAFKAL80ETC concert': backstage,
    'Aged Brie': aged_brie,
    'Conjured Mana Cake': conjured
}


def get(name):
    return qualities[name]
