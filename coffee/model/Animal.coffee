class @Animal
  constructor: (
    @sprite
    @position = new Vector 0.0, 0.0
    @velocity = new Vector 0.0, 0.0
    @acceleration = new Vector 0.0, 0.0
    @maxSpeed = 0.1
    @maxAcc = 0.1
    @maxTurnSpeed = 1.0
    @orientation = 0.0
    @attitude = 0.0
    @size = 1
    ) ->
    @sprite.position = @position
    @sprite.scale = new Vector(
      @size * Constants.TEX_SCALE,
      @size * Constants.TEX_SCALE
    )
    @sprite.anchor = new Vector 0.5, 0.5
