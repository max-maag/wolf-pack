class @Vector
  constructor: (@x = 0, @y = 0) ->

  clone: =>
    new Vector(@x, @y)

  set: (x = 0, y)=>
    if typeof x is "object"
      @x = x.x
      @y = x.y
    else
      @x = x
      @y = y ? x

  length: =>
    Math.sqrt @x*@x + @y*@y

  mul: (scalar) =>
    @x *= scalar
    @y *= scalar
    return this

  mulCpy: (scalar) =>
    @clone().mul scalar

  add: (val) =>
    if val instanceof Vector
      @x += val.x
      @y += val.y
    else
      @x += val
      @y += val

    return this

  addCpy: (val) =>
    @clone().add val

  sub: (val) =>
    if val instanceof Vector
      @x -= val.x
      @y -= val.y
    else
      @x -= val
      @y -= val

    return this

  subCpy: (val) =>
    @clone().sub val

  dot: (vec) =>
    @x*vec.x + @y*vec.y

  normalize: =>
    @mul 1.0/@length()

  toString: =>
    "(#{@x}, #{@y})"
