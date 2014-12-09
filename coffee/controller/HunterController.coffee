class @HunterController extends AnimalController
  constructor: (@game, @model, @damage = 1) ->
    super @game, @model

  eat: (amount) =>
    @model.setSize @model.size + amount
    @hp += amount

  onCollide: (other) =>
    if other.model.dead
      if other.model.size > Constants.SMALLEST_SIZE
        amount = Math.min 0.1, other.model.size - Constants.SMALLEST_SIZE
        other.model.setSize other.model.size - amount
        @eat amount
    else unless @model.dead
      other.takeDamage @damage, this
