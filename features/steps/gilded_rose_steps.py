# -*- coding: utf-8 -*-
"""step implementations for the gilded rose kata.
"""
from behave import given, when, then
from ensure import ensure


@given(u'an initial sell_in of {n:d} days')
def initial_sell_in_step_impl(context, n):
    context.initial_sell_in = n
    if hasattr(context, 'item'):
        context.item.sell_in = n


@given(u'an initial quality of {n:d}')
def initial_quality_step_impl(context, n):
    context.initial_quality = n
    if hasattr(context, 'item'):
        context.item.quality = n


@given(u'an item "{name}"')
def item_step_impl(context, name):
    from gilded_rose import Item
    context.item = Item(name, context.initial_quality, context.initial_sell_in)


@when(u'we update the item\'s quality')
def update_item_quality_step_impl(context):
    from gilded_rose import update_quality
    update_quality([context.item])


@then(u'the item\'s {attr} should be less {n:d}')
def attr_should_be_less_n_step_impl(context, attr, n):
    ensure(getattr(context.item, attr)).equals(
        getattr(context, "initial_" + attr) - n
    )


@then(u'the item\'s {attr} should be {n:d}')
def attr_should_be_n_step_impl(context, attr, n):
    ensure(getattr(context.item, attr)).equals(n)


@then(u'the item\'s {attr} should increase by {n:d}')
def attr_should_be_less_n_step_impl(context, attr, n):
    ensure(getattr(context.item, attr)).equals(
        getattr(context, "initial_" + attr) + n
    )
