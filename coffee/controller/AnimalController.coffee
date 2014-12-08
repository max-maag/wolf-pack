class @AnimalController
  constructor: (@model) ->
    @direction = new Vector 0.0, 0.0

  think: (dt) =>
    len = @direction.length()
    if len == 0
      @model.acceleration.set @model.velocity.x, @model.velocity.y
      @model.acceleration.mul(-0.9/dt)
    else if len > 1.0
      @direction.normalize()
      len = 1.0

      #console.log "d: #{@direction}"
      @model.acceleration = @direction.mulCpy @model.maxAcc
      #@direction.set 0
