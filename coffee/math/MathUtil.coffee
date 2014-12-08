class @MathUtil
  @randInt: (min, max) ->
    # x | 0 == Math.floor(x), only faster
    (Math.random()*(max-min+1) + min) | 0
