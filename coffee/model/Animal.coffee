class @Animal
  constructor: (
    @position = new Vector 0.0, 0.0
    @speed = new Vector 0.0, 0.0
    @acceleration = new Vector 0.0, 0.0
    @maxSpeed = 1
    @maxTurnSpeed = 1.0
    @orientation = 0.0
    @attitude = 0
    ) ->
