class @Animal
  constructor: (
    @sprite
    @position = new Vector 0.0, 0.0
    @velocity = new Vector 0.0, 0.0
    @acceleration = new Vector 0.0, 0.0
    @maxSpeed = 0.1
    @maxAcc = 0.2
    @maxTurnSpeed = 1.0
    @orientation = 0.0
    @attitude = 0.0
    ) ->
    @sprite.position = @position
