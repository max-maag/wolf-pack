class @Vector extends PIXI.Point
  length: =>
    Math.sqrt @x*@x + @y*@y
