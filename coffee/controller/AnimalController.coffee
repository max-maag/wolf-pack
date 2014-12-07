class @AnimalController
  constructor: (@model) ->
    @direction = new Vector 0.0, 0.0

  think: =>
    len = @direction.length()
    if len > 1.0
      @direction.normalize()
      len = 1.0

    @model.acceleration = @direction.mulCpy @model.maxAcc
