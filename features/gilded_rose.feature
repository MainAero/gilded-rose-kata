Feature: The Gilded Rose: updating quality of items

    Hi and welcome to team Gilded Rose. As you know, we are a small inn with a
    prime location in a prominent city run by a friendly innkeeper named
    Allison. We also buy and sell only the finest goods. Unfortunately, our
    goods are constantly degrading in quality as they approach their sell by
    date. We have a system in place that updates our inventory for us. It was
    developed by a no-nonsense type named Leeroy, who has moved on to new
    adventures. Your task is to add the new feature to our system so that we
    can begin selling a new category of items. First an introduction to our
    system:

    All items have a SellIn value which denotes the number of days we have to
    sell the item All items have a Quality value which denotes how valuable the
    item is At the end of each day our system lowers both values for every item
    Pretty simple, right? Well this is where it gets interesting:

    - Once the sell by date has passed, Quality degrades twice as fast

    - The Quality of an item is never negative
    - "Aged Brie" actually increases in Quality the older it gets
    - The Quality of an item is never more than 50
    - "Sulfuras", being a legendary item, never has to be sold or decreases in
      Quality
    - "Backstage passes", like aged brie, increases in Quality as it's SellIn
      value approaches; Quality increases by 2 when there are 10 days or less
      and by 3 when there are 5 days or less but Quality drops to 0 after the
      concert

    We have recently signed a supplier of conjured items. This requires an update to our system:

    - "Conjured" items degrade in Quality twice as fast as normal items

    Feel free to make any changes to the UpdateQuality method and add any new
    code as long as everything still works correctly. However, do not alter the
    Item class or Items property as those belong to the goblin in the corner
    who will insta-rage and one-shot you as he doesn't believe in shared code
    ownership (you can make the UpdateQuality method and Items property static
    if you like, we'll cover for you). Your work needs to be completed by
    Friday, February 18, 2011 08:00:00 AM PST.

    Just for clarification, an item can never have its Quality increase above
    50, however "Sulfuras" is a legendary item and as such its Quality is 80
    and it never alters.

    Background:
      Given an initial sell_in of 5 days
        And an initial quality of 10

    Scenario: Normal item, before sell date.
      Given an item "NORMAL ITEM"

       When we update the item's quality
       Then the item's quality should be less 1
        And the item's sell_in should be less 1

    Scenario: Normal item, on sell date.
      Given an item "NORMAL ITEM"
        And an initial sell_in of 0 days

       When we update the item's quality
       Then the item's quality should be less 2
        And the item's sell_in should be less 1

    Scenario: Normal item, after sell date.
      Given an item "NORMAL ITEM"
        And an initial sell_in of -10 days

       When we update the item's quality
       Then the item's quality should be less 2
        And the item's sell_in should be less 1

    Scenario: Normal item, of zero quality
      Given an item "NORMAL ITEM"
        And an initial quality of 0

       When we update the item's quality
       Then the item's quality should be 0
        And the item's sell_in should be less 1

    Scenario: Aged Brie, before sell date
      Given an item "Aged Brie"

       When we update the item's quality
       Then the item's quality should increase by 1
        And the item's sell_in should be less 1

    Scenario: Aged Brie, before sell date, with max quality
      Given an item "Aged Brie"
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Aged Brie, on sell date
      Given an item "Aged Brie"
        And an initial sell_in of 0 days

       When we update the item's quality
       Then the item's quality should increase by 2
        And the item's sell_in should be less 1

    Scenario: Aged Brie, on sell date, near max quality
      Given an item "Aged Brie"
        And an initial sell_in of 0 days
        And an initial quality of 49

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Aged Brie, on sell date, with max quality
      Given an item "Aged Brie"
        And an initial sell_in of 0 days
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Aged Brie, after sell date
      Given an item "Aged Brie"
        And an initial sell_in of -10 days

       When we update the item's quality
       Then the item's quality should increase by 2
        And the item's sell_in should be less 1

    Scenario: Aged Brie, on sell date, near max quality
      Given an item "Aged Brie"
        And an initial sell_in of -10 days
        And an initial quality of 49

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Aged Brie, on sell date, with max quality
      Given an item "Aged Brie"
        And an initial sell_in of -10 days
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Sulfuras, before sell date
      Given an item "Sulfuras, Hand of Ragnaros"

       When we update the item's quality
       Then the item's quality should be 10
        And the item's sell_in should be 5

    Scenario: Sulfuras, on sell date
      Given an item "Sulfuras, Hand of Ragnaros"
        And an initial sell_in of 0 days

       When we update the item's quality
       Then the item's quality should be 10
        And the item's sell_in should be 0

    Scenario: Sulfuras, after sell date
      Given an item "Sulfuras, Hand of Ragnaros"
        And an initial sell_in of -10 days

       When we update the item's quality
       Then the item's quality should be 10
        And the item's sell_in should be -10

    Scenario: Backstage pass, long before sell date
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 11 days

       When we update the item's quality
       Then the item's quality should increase by 1
        And the item's sell_in should be less 1

    Scenario: Backstage pass, long before sell date, at max quality
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 11 days
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Backstage pass, medium close to sell date (upper bound)
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 10 days

       When we update the item's quality
       Then the item's quality should increase by 2
        And the item's sell_in should be less 1

    Scenario: Backstage pass, medium close to sell date (upper bound), at max quality
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 10 days
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Backstage pass, medium close to sell date (lower bound)
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 6 days

       When we update the item's quality
       Then the item's quality should increase by 2
        And the item's sell_in should be less 1

    Scenario: Backstage pass, medium close to sell date (lower bound), at max quality
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 10 days
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Backstage pass, very close to sell date (upper bound)
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 5 days

       When we update the item's quality
       Then the item's quality should increase by 3
        And the item's sell_in should be less 1

    Scenario: Backstage pass, very close to sell date (upper bound), at max quality
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 5 days
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Backstage pass, very close to sell date (lower bound)
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 1 days

       When we update the item's quality
       Then the item's quality should increase by 3
        And the item's sell_in should be less 1

    Scenario: Backstage pass, very close to sell date (lower bound), at max quality
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 1 days
        And an initial quality of 50

       When we update the item's quality
       Then the item's quality should be 50
        And the item's sell_in should be less 1

    Scenario: Backstage pass, on sell date
      Given an item "Backstage passes to a TAFKAL80ETC concert"
        And an initial sell_in of 0 days

       When we update the item's quality
       Then the item's quality should be 0
        And the item's sell_in should be less 1

    Scenario: Conjured item, before sell date.
      Given an item "Conjured Mana Cake"

       When we update the item's quality
       Then the item's quality should be less 2
        And the item's sell_in should be less 1

    Scenario: Conjured item, before sell date, at zero quality
      Given an item "Conjured Mana Cake"
        And an initial quality of 0

       When we update the item's quality
       Then the item's quality should be 0
        And the item's sell_in should be less 1

    Scenario: Conjured item, on sell date.
      Given an item "Conjured Mana Cake"
        And an initial sell_in of 0 days

       When we update the item's quality
       Then the item's quality should be less 4
        And the item's sell_in should be less 1

    Scenario: Conjured item, on sell date, at zero quality
      Given an item "Conjured Mana Cake"
        And an initial sell_in of 0 days
        And an initial quality of 0

       When we update the item's quality
       Then the item's quality should be 0
        And the item's sell_in should be less 1

    Scenario: Conjured item, after sell date.
      Given an item "Conjured Mana Cake"
        And an initial sell_in of -10 days

       When we update the item's quality
       Then the item's quality should be less 4
        And the item's sell_in should be less 1

    Scenario: Conjured item, after sell date, at zero quality
      Given an item "Conjured Mana Cake"
        And an initial sell_in of -10 days
        And an initial quality of 0

       When we update the item's quality
       Then the item's quality should be 0
        And the item's sell_in should be less 1
