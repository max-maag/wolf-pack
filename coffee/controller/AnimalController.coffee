class @AnimalController
  constructor: (@model) ->
    @direction = new Vector 0.0, 0.0

  think: =>
    len = @direction.x * @direction.x + @direction.y * @direction.y
    if len > 1
      @direction.x /= len
      @direction.y /= len
      len = 1

  #TODO  @acceleration =
