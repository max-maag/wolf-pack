class @AnimalController
  constructor: (@model) ->
    @direction = new Vector 0.0, 0.0

  think: (dt) =>
    len = @direction.length()
    if len is 0
      @model.acceleration.set @model.velocity
      @model.acceleration.mul(-0.9/dt)
    else
      dir = @direction.copy()
      if len > 1.0
        dir.normalize()
        len = 1.0

      #console.log "d: #{@direction}"
      @model.acceleration.set dir.mul @model.maxAcc
      #@direction.set 0
