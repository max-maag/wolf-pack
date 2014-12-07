#extends PIXI.Point
class @Vector
  constructor: (@x = 0, @y = 0) ->

  clone: =>
    return new Vector(@x, @y)

  set: (x = 0, y)=>
    @x = x
    @y = y ? x

  length: =>
    return Math.sqrt @x*@x + @y*@y
