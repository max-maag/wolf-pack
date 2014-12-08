class @Animal
  constructor: (
    @sprite
    @position = new Vector 0.0, 0.0
    @velocity = new Vector 0.0, 0.0
    @acceleration = new Vector 0.0, 0.0
    @maxSpeed = 20
    @maxAcc = 200
    @maxTurnSpeed = 1.0
    @orientation = 0.0
    @attitude = 0.0
    @size = 1
    ) ->
    @sprite.position = @position.mulCpy(Constants.UNIT)
    @sprite.scale = new Vector(
      @size * Constants.TEX_SCALE,
      @size * Constants.TEX_SCALE
    )
    @sprite.anchor = new Vector 0.5, 0.5

  setSize: (size) =>
    @size = size
    @sprite.scale.set @size * Constants.TEX_SCALE

  setPosition: (vec) =>
    @position.set vec
    @sprite.position.set vec
    @sprite.position.mul Constants.UNIT

  getRadius: =>
    @size * Constants.TEX_UNIT
