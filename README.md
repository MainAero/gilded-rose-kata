[![Build Status](https://travis-ci.org/MainAero/gilded-rose-kata.svg?branch=master)](https://travis-ci.org/MainAero/gilded-rose-kata)
[![Code Climate](https://codeclimate.com/github/MainAero/gilded-rose-kata/badges/gpa.svg)](https://codeclimate.com/github/MainAero/gilded-rose-kata)
[![Test Coverage](https://codeclimate.com/github/MainAero/gilded-rose-kata/badges/coverage.svg)](https://codeclimate.com/github/MainAero/gilded-rose-kata/coverage)
# The Gilded Rose Code Kata

My refactored solution for the [changed](https://github.com/eykd/gilded-rose-kata) gilded rose code kata.
The branch `original` has the non-refactored version.

This is a Python version of the Gilded Rose Kata, based on the Ruby version
found [here](https://github.com/jimweirich/gilded_rose_kata/), based on the
original found
[here](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

## Changes from the original

This Python version follows the original code very closely, but has the
following changes:

* The original had no tests.  Since this is a refactoring kata, I feel
  the tests are important and provide a fairly complete test suite.
  Just delete the tests if you wish to "go it alone".

* The original used a hard coded set of "items", presumably for
  testing the code.  Since I added a test suite, the hard coded values
  were not of much use.  I also changed the interface to accept a list of
  items as a parameter rather than a hard coded constant.

You can read
[the original kata article](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/) for more details.

## Installation Hints

The easiest way is to use pip to install the dependencies:

    make install


## Running the tests

Only tests

    make test

with coverage report

    make test-with-coverage


# Original Description of the Gilded Rose

Hi and welcome to team Gilded Rose. As you know, we are a small inn
with a prime location in a prominent city run by a friendly innkeeper
named Allison. We also buy and sell only the finest
goods. Unfortunately, our goods are constantly degrading in quality as
they approach their sell by date. We have a system in place that
updates our inventory for us. It was developed by a no-nonsense type
named Leeroy, who has moved on to new adventures. Your task is to add
the new feature to our system so that we can begin selling a new
category of items. First an introduction to our system:

- All items have a SellIn value which denotes the number of days we
  have to sell the item
- All items have a Quality value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

  - Once the sell by date has passed, Quality degrades twice as fast
  - The Quality of an item is never negative
  - "Aged Brie" actually increases in Quality the older it gets
  - The Quality of an item is never more than 50
  - "Sulfuras", being a legendary item, never has to be sold or
    decreases in Quality
  - "Backstage passes", like aged brie, increases in Quality as it's
    SellIn value approaches; Quality increases by 2 when there are 10
    days or less and by 3 when there are 5 days or less but Quality
    drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any
new code as long as everything still works correctly. However, do not
alter the Item class or Items property as those belong to the goblin
in the corner who will insta-rage and one-shot you as he doesn't
believe in shared code ownership (you can make the UpdateQuality
method and Items property static if you like, we'll cover for
you). Your work needs to be completed by Friday, February 18, 2011
08:00:00 AM PST.

Just for clarification, an item can never have its Quality increase
above 50, however "Sulfuras" is a legendary item and as such its
Quality is 80 and it never alters.
