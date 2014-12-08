class @MathUtil
  @randInt: (min, max) ->
    max - (max-min)*(1-Math.random())
