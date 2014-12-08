class @AnimalController
  constructor: (@model) ->
    @direction = new Vector 0.0, 0.0

  think: (dt) =>
    len = @direction.length()
    dir = @direction.clone()

    if len > 1.0
      dir.normalize()
      len = 1.0

    @model.acceleration.set dir.mul @model.maxAcc

    @model.acceleration.x -= Constants.STOP_FORCE * @model.velocity.x / dt
    @model.acceleration.y -= Constants.STOP_FORCE * @model.velocity.y / dt
