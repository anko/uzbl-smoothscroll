#!/bin/env lsc
require! \d3
scroll = (direction, amount, absolute=false) !->
  scroll-tween = (offset) ->
    scroll-tween = switch direction
    | \vertical =>
      ->
        lerp = d3.interpolate-number do
          window.page-y-offset
          if absolute then offset else window.page-y-offset + offset
        (t) -> window.scroll-to do
          window.page-x-offset
          lerp t
    | \horizontal =>
      ->
        lerp = d3.interpolate-number do
          window.page-x-offset
          if absolute then offset else window.page-x-offset + offset
        (t) -> window.scroll-to do
          lerp t
          window.page-y-offset

  d3.transition!
    #.ease \elastic 2 3
    .ease \poly-out 2.5
    .duration 180
    .tween "scroll", scroll-tween amount

uzbl.scroll-pixels = scroll
uzbl.scroll-percent = (direction, amount) !->

  view-height = window.inner-height
  amount = view-height * amount / 100

  scroll direction, amount

uzbl.scroll-page-percent = (direction, amount) !->

  page-height = document.body.get-bounding-client-rect!height - window.inner-height
  amount = page-height * amount / 100

  scroll direction, amount, true
